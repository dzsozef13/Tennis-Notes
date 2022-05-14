//
//  QuotesManagers.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 17..
//

import Foundation

class QuotesManager {
    
    internal var quotes: [Quote] = []
    
    init(storage: AppStorage? = AppContext.storage) {
        self.quotes = []
        let storage = AppStorage()
        storage.loadQuotes { (success, quotes) in
            if success {
                self.quotes = quotes ?? []
            } else {
                print("Error loading quotes")
            }
        }
    }
    
}
