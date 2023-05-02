//
//  Work_Time_TrackerApp.swift
//  Work Time Tracker
//
//  Created by Nathaniel Law on 3/17/23.
//

import SwiftUI

@main
struct Work_Time_TrackerApp: App {
    
    // Create the data that was created from the data model using an "@StateObject"
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the data model into the app using the ".environment" modifier
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
