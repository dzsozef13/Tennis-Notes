//
//  TargetNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 19..
//
//

import Foundation
import CoreData


extension TargetNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TargetNote> {
        let fetchRequest = NSFetchRequest<TargetNote>(entityName: "TargetNote")
        let sort = NSSortDescriptor(key: #keyPath(TargetNote.date), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        return fetchRequest
    }

    @NSManaged public var date: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var achieved: NSNumber?

}

extension TargetNote : Identifiable {

}
