//
//  TargetNote+CoreDataClass.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 19..
//
//

import Foundation
import CoreData

@objc(TargetNote)
public class TargetNote: NSManagedObject {
    override public func awakeFromFetch() {
        if self.achieved == nil {
            self.achieved = false
        }
    }
}
