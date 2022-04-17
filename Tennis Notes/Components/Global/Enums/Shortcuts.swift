//
//  Shortcuts.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 17..
//

import Foundation

enum Shortcut: String {
    case targets = "targets"
    case errors = "errors"
    case players = "palyers"
    case matches = "matches"
    
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
