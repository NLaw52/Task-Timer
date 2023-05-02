//
//  SessionManager.swift
//  Work Time Tracker
//
//  Created by Nathaniel Law on 3/20/23.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {
    // Set the elapsed time variable to "Published" so it knows to reload itself everytime the value of the variable changes
    @Published var timeElapsed = 0.0
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timeElapsed += 1.0
        }
    }
    
    func stop() {
        timer.invalidate()
        timeElapsed = 0.0
    }
}
