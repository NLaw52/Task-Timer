//
//  TimeFormatting.swift
//  Work Time Tracker
//
//  Created by Nathaniel Law on 3/17/23.
//

import Foundation


func calcTimeElapsed(start: Date, accum: Double) -> Double {
    let startTime = Int(-start.timeIntervalSinceNow)
    
    return Double(startTime) + accum
}

func formattedTime(total: Double) -> String {
    
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    let totalInt = Int(total)
    
    if totalInt < 60 {
        seconds = totalInt
    } else {
        minutes = totalInt / 60
        seconds = (totalInt - (minutes * 60))
        if minutes < 60 {
            minutes = totalInt / 60
            seconds = (totalInt - (minutes * 60))
        } else {
            hours = totalInt / (60 * 60)
            minutes = (totalInt - (hours * 60 * 60)) / 60
            seconds = (totalInt - (hours * 60 * 60) - (minutes * 60))
        }
    }

    return "\(hours)h : \(minutes)m : \(seconds)s"
}
