//
//  DataController.swift
//  Work Time Tracker
//
//  Created by Nathaniel Law on 3/17/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    // "container" is essentially the model itself - persists the data
    let container = NSPersistentContainer(name: "TaskModel")
    
    // Create initializer to load the persistent store/data
    init() {
        container.loadPersistentStores { desc, error in         // Load the data and provide a description along with an error if one occurs
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    // Create a "save" function to update data
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("Data could not be saved...")
        }
    }
    
    // Create an "add" function
    func addTask(name: String, date: Date, context: NSManagedObjectContext) {
        // Creating a "Task" object adds an object to the CoreData model
        let task = Task(context: context)
        task.accumulated = 0
        task.name = name
        task.status = false
        task.date = Date()
        task.start = Date()
        task.stop = Date()
        
        save(context: context)
    }
}
