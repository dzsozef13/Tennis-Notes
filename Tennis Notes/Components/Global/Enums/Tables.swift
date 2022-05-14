//
//  Tables.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 17..
//

import Foundation

enum Table: String, CaseIterable {
    
    // Shortcut cases
    case targets = "targets"
    case errors = "errors"
    case players = "palyers"
    case matches = "matches"
    
    // Return index
    func tabBarItemIndex() -> Int {
        switch self {
        case .targets:
            return 1
        case .errors:
            return 1
        case .players:
            return 2
        case .matches:
            return 2
        }
    }
    
}
