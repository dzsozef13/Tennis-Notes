//
//  PlayerNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//
//

import Foundation
import CoreData


extension PlayerNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerNote> {
        return NSFetchRequest<PlayerNote>(entityName: "PlayerNote")
    }

    @NSManaged public var name: String?
    @NSManaged public var strength: String?
    @NSManaged public var weakness: String?
    @NSManaged public var matchWin: Int64
    @NSManaged public var matchLoss: Int64
    @NSManaged public var note: String?
    @NSManaged public var matches: MatchNote?

}

extension PlayerNote : Identifiable {

}
