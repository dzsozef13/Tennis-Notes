//
//  AppStorage.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 16..
//

import Foundation

class AppStorage {
    
    static let shared = AppStorage()
    public typealias QuotesCompletionHandler = (_ success: Bool, [Quote]?) -> Void
    
    // MARK: Load Quotes
    public func loadTasks(completionHandler: @escaping QuotesCompletionHandler) {

        if let file = Bundle(for: type(of: self)).url(forResource: "quotes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let sensorDictionary = try JSONDecoder().decode([String: Quote].self, from: data)
                let quotes = sensorDictionary.map { sensor in sensor.value }
                
                completionHandler(true, quotes)
                print(quotes)
            } catch let error {
                completionHandler(false, nil)
                print(error)
            }
        } else {
            print("No file")
        }
    }
    
}
