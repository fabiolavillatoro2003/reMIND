//
//  TimeFormatting.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/28/23.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes == 1 {
        return "Added \(minutes) minute ago"
    } else if minutes < 120 {
        return "Added \(minutes) minutes ago"
    } else if minutes >= 120 && hours < 48 {
        return "Added \(hours) hours ago"
    } else {
        return "Added \(days) days ago"
    }
        
}
