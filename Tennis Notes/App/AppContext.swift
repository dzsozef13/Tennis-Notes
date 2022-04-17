//
//  AppContext.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 17..
//

import Foundation

public class AppContext {
    static var storage: AppStorage?
}

extension AppContext {
    var storage: AppStorage {
        get {
            return AppContext.storage!
        }
    }
}
