//
//  Date+Extension.swift
//  PetSociety
//
//  Created by Layla Cisneros on 11/04/2023.
//

import Foundation

extension Date {
    func timeSince() -> String {
        let interval = Date().timeIntervalSince(self)
        
        let fiveMinutes: Double = 300
        let oneHour: Double = 3600
        let aDay: Double = 86400
        let aMonth: Double = 2592000
        
        let intervalInMinutes = Int(interval/60)
        let intervalInHours = intervalInMinutes/60
        let intervalInDays = intervalInHours/24
        
        switch interval{
        case 0..<fiveMinutes:
            return "Just now"
        case fiveMinutes..<oneHour:
            return "\(intervalInMinutes) minutos"
        case oneHour..<aDay:
            return "\(intervalInHours) hours"
        case aDay..<aMonth:
            return "\(intervalInDays) days"
        default:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: self)
        }
    }
}
