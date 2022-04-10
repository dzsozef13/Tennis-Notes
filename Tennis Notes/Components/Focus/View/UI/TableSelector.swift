//
//  TableSelector.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//

import Foundation
import UIKit

enum TableSelector {
    case targets
    case errors
    
    func displayTitle() -> String {
        switch self {
        case .targets:
            return "Targets"
        case .errors:
            return "Errors"
        }
    }
    
    func selectedTint() -> UIColor {
        return UIColor.systemYellow
    }
}
