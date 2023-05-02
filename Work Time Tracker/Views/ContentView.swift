//
//  ContentView.swift
//  Work Time Tracker
//
//  Created by Nathaniel Law on 3/17/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // Create "environment object"
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var task: FetchedResults<Task>
    
    @State private var showingAlert = false
    @State private var name = ""
    
    // Instantiate the session timer
    // Set the session timer variable to an "ObservedObject" so it can automatically update the displayed time value as it changes (updates every second)
    // The value of the seconds counter changes every second so it pings the "SessionManager" and automatically updates the time that will be displayed
    @ObservedObject private var session = SessionManager()
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(task) { task in
                        HStack {
                            VStack(alignment: .leading, spacing: 10){
                                Text(task.name!)
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                VStack{
                                    Text("Total Time:")
                                        .font(.headline)
                                    Text(formattedTime(total: task.accumulated))
                                        .foregroundColor(.blue)
                                }
                            }
                            .frame(minWidth: 200, alignment: .leading)
                            Spacer()
                            VStack(alignment: .center){
                                Spacer()
                                HStack{
                                    Button(action: {
                                        task.status = true
                                        task.start = Date()
                                        
                                        // Create a new timer everytime the "play" button is clicked
                                        session.start()
                                    }) {
                                        Image(systemName: "play.circle")
                                            .imageScale(.large)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    // Display the updated session timer
                                    
                                    Spacer()
                                    Button(action: {
                                        // Add conditional check here to prevent unwanted changes to the time if "pause" button clicked repeatedly without pressing "play" beforehand
                                        if task.status == true {
                                            task.status = false
                                            task.accumulated = calcTimeElapsed(start: task.start!, accum: task.accumulated)
                                            
                                            // Stop the session timer
                                            session.stop()
                                            
                                            // Push changes to core data
                                            DataController().save(context: managedObjContext)
                                        }
                                    }) {
                                        Image(systemName: "pause.circle")
                                            .imageScale(.large)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                VStack{
                                    Text("Current Session:")
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    // Display running time for current session
                                    Text(formattedTime(total: session.timeElapsed))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .listRowBackground(Color(task.status ? UIColor.systemGreen : UIColor.systemBackground).animation(.easeInOut))
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Tasks + Projects")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .alert("Add Task", isPresented: $showingAlert) {
                        TextField("Enter New Task: ", text: $name)
                        Button("Cancel", action: {})
                        Button("Add", action: addTask)
                    }
                }
            }
        }
    }
    
    private func addTask() {
        DataController().addTask(name: name, date: Date(), context: managedObjContext)
        name = ""
    }
    
    // SwiftUI gives delete animation and functionality for free (built-in already)
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { task[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
