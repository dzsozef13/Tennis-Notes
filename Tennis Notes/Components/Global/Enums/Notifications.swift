//
//  Notifications.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 01..
//

import Foundation

enum Notification: String {
    
    case AddedTargetNote = "AddedTargetNote"
    case AddedErrorNote = "AddedErrorNote"
    case AddedPlayerNote = "AddedPlayerNote"
    case AddedMatchNote = "AddedMatchNote"
    
    func notificationName() -> NSNotification.Name {
        switch self {
        case .AddedTargetNote:
            return NSNotification.Name(rawValue: Notification.AddedTargetNote.rawValue)
        case .AddedErrorNote:
            return NSNotification.Name(rawValue: Notification.AddedErrorNote.rawValue)
        case .AddedPlayerNote:
            return NSNotification.Name(rawValue: Notification.AddedPlayerNote.rawValue)
        case .AddedMatchNote:
            return NSNotification.Name(rawValue: Notification.AddedMatchNote.rawValue)
        }
    }
    
}
