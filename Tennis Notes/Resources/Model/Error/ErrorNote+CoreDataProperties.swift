//
//  ErrorNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//
//

import Foundation
import CoreData


extension ErrorNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ErrorNote> {
        return NSFetchRequest<ErrorNote>(entityName: "ErrorNote")
    }

    @NSManaged public var title: String?
    @NSManaged public var note: String?

}

extension ErrorNote : Identifiable {

}
