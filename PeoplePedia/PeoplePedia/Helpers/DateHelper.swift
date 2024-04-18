//
//  DateHelper.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct DateHelper {
    static func formatDate(from dateString: String) -> [String] {
        var formattedValues = Array<String>()
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd"
            
            let formattedDate = outputFormatter.string(from: date)
            formattedValues.append(formattedDate)
            
            let currentDate = Date()
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: date, to: currentDate)
            
            if let age = ageComponents.year {
                formattedValues.append(String(age))
            }
        }
        
        return formattedValues
    }
}
