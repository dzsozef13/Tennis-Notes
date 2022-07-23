//
//  Date+Formatter.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 07. 23..
//

import Foundation

extension Date {
    
    enum DateFormat: String {
        /// 13. October
        case DM = "dd. MMMM"
        /// 13/10, 09:32
        case DMHM = "dd/MM, HH:mm"
        /// 13/10/2000
        case DMY = "dd/MM/yyyy"
        /// 13/10/2000, 09:32
        case DMYHM = "dd/MM/yyyy, HH:mm"
    }
    
    /// Returns a String representation of the Date, using a DateFormat
    func string(with format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
}
