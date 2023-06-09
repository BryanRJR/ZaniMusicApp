//
//  CoreDataManager.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared = CoreDataManager()

    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MusicApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
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

    // MARK: - Searching for tracks
    func search(for trackId: Int) -> [TrackLocal] {
        let request = NSFetchRequest<TrackLocal>(entityName: "TrackLocal")

        request.predicate = NSPredicate(format: "trackId == %i", trackId)

        do {
            let results = try managedObjectContext.fetch(request)
            return results
        } catch {
            return []
        }
    }
}
