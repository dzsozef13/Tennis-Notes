//
//  MatchNote+CoreDataProperties.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//
//

import Foundation
import CoreData


extension MatchNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MatchNote> {
        return NSFetchRequest<MatchNote>(entityName: "MatchNote")
    }

    @NSManaged public var gamesSelf: Int64
    @NSManaged public var gamesOpponent: Int64
    @NSManaged public var setsSelf: Int64
    @NSManaged public var setsOpponent: Int64
    @NSManaged public var note: String?
    @NSManaged public var opponent: PlayerNote?

}

extension MatchNote : Identifiable {

}
