//
//  AnalyticsManager.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 15..
//

import Foundation
import FirebaseAnalytics

class AnalyticsManager {
    static let logger = AnalyticsManager()
    
    public func log(event: String, parameters: [String : Any]?) {
        Analytics.logEvent(event, parameters: parameters)
    }
}
