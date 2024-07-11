//
//  CoreDataHandler.swift
//  Hearty
//
//  Created by Himesh on 10/31/22.
//

import UIKit
import CoreData

class CoreDataHandler {
    
    private let viewContext: NSManagedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
    
    func add<T: NSManagedObject> (_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else { return nil }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else { return nil }
        let object = T(entity: entity, insertInto: viewContext)
        return object
    }
    
    func fetch<T: NSManagedObject> (_ type: T.Type) -> [T] {
        let request = T.fetchRequest()
        do {
            let result = try viewContext.fetch(request)
            return result as! [T]
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func fetchData<T: NSManagedObject> (_ entityName: String) -> [T] {
        var arrData = [T]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do {
            arrData = try viewContext.fetch(fetchRequest) as! [T]
        } catch {
            debugPrint("Couldn't get messages")
        }
        return arrData
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete<T: NSManagedObject> (object: T) {
        viewContext.delete(object)
        save()
    }
    
    func deleteAllRecords(_ entityName: String) {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
        } catch {
            debugPrint("Couldn't delete Records")
        }
    }
    
}

class DataTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        return value
    }
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        return value
    }
}

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        ValueTransformer.setValueTransformer(
            DataTransformer(),
            forName: NSValueTransformerName("DataTransformer")
        )
        
        persistentContainer = NSPersistentContainer(name: "CacheDatabase")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError ("Unable to initialize Core Data \(error)")
            }
        }
    }
}
