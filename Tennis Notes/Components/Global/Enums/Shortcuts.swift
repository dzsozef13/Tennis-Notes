//
//  Shortcuts.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 17..
//

import Foundation

enum Shortcut: String, CaseIterable {
    
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
    
    // Save selected table
    func didTapShortcut(shortcut: Shortcut) {
        for sc in Shortcut.allCases {
            UserDefaults.standard.set(false, forKey: sc.rawValue)
        }
        switch self {
        case .targets:
            UserDefaults.standard.set(true, forKey: shortcut.rawValue)
        case .errors:
            UserDefaults.standard.set(true, forKey: shortcut.rawValue)
        case .players:
            UserDefaults.standard.set(true, forKey: shortcut.rawValue)
        case .matches:
            UserDefaults.standard.set(true, forKey: shortcut.rawValue)
        }
    }
}
