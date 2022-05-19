//
//  ErrorNote+CoreDataClass.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 19..
//
//

import Foundation
import CoreData

@objc(ErrorNote)
public class ErrorNote: NSManagedObject {
    override public func awakeFromFetch() {
        if self.corrected == nil {
            self.corrected = false
        }
    }
}
