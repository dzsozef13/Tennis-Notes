//
//  TargetNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//
//

import Foundation
import CoreData


extension TargetNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TargetNote> {
        return NSFetchRequest<TargetNote>(entityName: "TargetNote")
    }

    @NSManaged public var title: String?
    @NSManaged public var note: String?

}

extension TargetNote : Identifiable {

}
