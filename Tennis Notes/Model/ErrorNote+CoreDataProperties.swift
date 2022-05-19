//
//  ErrorNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 19..
//
//

import Foundation
import CoreData


extension ErrorNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ErrorNote> {
        let fetchRequest = NSFetchRequest<ErrorNote>(entityName: "ErrorNote")
        let sort = NSSortDescriptor(key: #keyPath(ErrorNote.date), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        return fetchRequest
    }

    @NSManaged public var date: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var corrected: NSNumber?

}

extension ErrorNote : Identifiable {

}
