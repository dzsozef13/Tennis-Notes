//
//  AppStorage.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 16..
//

import Foundation
import CoreData

class AppStorage {
    
    static let shared = AppStorage()
    public typealias QuotesCompletionHandler = (_ success: Bool, [Quote]?) -> Void
    
    // MARK: CodeData
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // TODO: Correct error handling
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: CoreData Saving support
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Correct error handling
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: CoreData Fetching
    func fetchItems(item: ManagedContextObject) -> [AnyObject] {
        let context = persistentContainer.viewContext
        var items = [AnyObject]()
        switch item {
        case .target:
            do {
                items = try context.fetch(TargetNote.fetchRequest())
            } catch {
                print("\("Failed to fetch items:") \(error)")
            }
        case .error:
            do {
                items = try context.fetch(ErrorNote.fetchRequest())
            } catch {
                print("\("Failed to fetch items:") \(error)")
            }
        case .player:
            do {
                items = try context.fetch(PlayerNote.fetchRequest())
            } catch {
                print("\("Failed to fetch items:") \(error)")
            }
        case .match:
            do {
                items = try context.fetch(MatchNote.fetchRequest())
            } catch {
                print("\("Failed to fetch items:") \(error)")
            }
        }
        return items
    }
    
    // MARK: CoreData Creating
    func createTargetNote(title: String?, content: String?) {
        let context = persistentContainer.viewContext
        // Create new target in context
        let newTarget = TargetNote(context: context)
        newTarget.title = title
        newTarget.note = content
        newTarget.date = Date()
        // Save context
        self.saveContext()
    }
    
    func createErrorNote(title: String?, content: String?) {
        let context = persistentContainer.viewContext
        // Create new target in context
        let newError = ErrorNote(context: context)
        newError.title = title
        newError.note = content
        newError.date = Date()
        // Save context
        self.saveContext()
    }
    
    // MARK: Load Quotes
    public func loadQuotes(completionHandler: @escaping QuotesCompletionHandler) {

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
