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

    // MARK: CodeData Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: CoreData Saving
    /// Saves all entities in the context if any has changes
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: CoreData Fetching
    /// Fetches all objects of a type of ManagedContextObject from the context
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
    /// Creates a TargetNote in the context and saves it
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
    /// Creates an ErrorNote in the context and saves it
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
    /// Deletes a TargetNote from the context and saves the change
    func deleteTargetNote(note: TargetNote) {
        let context = persistentContainer.viewContext
        // Delete target note from  context
        context.delete(note)
        self.saveContext()
    }
    /// Deletes an ErrorNote from the context and saves the change
    func deleteErrorNote(note: ErrorNote) {
        let context = persistentContainer.viewContext
        // Delete error note from  context
        context.delete(note)
        self.saveContext()
    }
    /// Toggles the "achieved" property of a TargetNote and saves the change
    func toggleTargetNote(note: TargetNote) {
        if note.achieved == 1 {
            note.achieved = 0
        } else { note.achieved = 1 }
        self.saveContext()
    }
    /// Toggles the "achieved" property of an ErrorNote and saves the change
    func toggleErrorNote(note: ErrorNote) {
        if note.corrected == 1 {
            note.corrected = 0
        } else { note.corrected = 1 }
        self.saveContext()
    }

    // MARK: Load Quotes
    /// Completion handler of fetching quotes, returns true and an array of Quote objects if successful
    typealias QuotesCompletionHandler = (_ success: Bool, [Quote]?) -> Void
    /// Decodes quotes from quotes.json into Quote objects
    public func loadQuotes(completionHandler: @escaping QuotesCompletionHandler) {
        if let file = Bundle(for: type(of: self)).url(forResource: "quotes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let sensorDictionary = try JSONDecoder().decode([String: Quote].self, from: data)
                let quotes = sensorDictionary.map { sensor in sensor.value }
                completionHandler(true, quotes)
            } catch let error {
                completionHandler(false, nil)
                print(error)
            }
        } else { print("Missing file: quotes.json") }
    }

}
