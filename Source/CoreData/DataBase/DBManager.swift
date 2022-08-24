//
//  DBManager.swift
//
//  Created by Sun on 10/12/2021.
//

import UIKit
import CoreData

public protocol DBManagerType {
    var viewContext: NSManagedObjectContext { get }
    func save()
    func request(input: CoreDataBaseRequest) -> [CoreDataBaseRequest.T]
    func delete(object: NSManagedObject)
}

@available(iOSApplicationExtension, unavailable)
@objcMembers final public class DBManager {
 
    static public let shared: DBManagerType = DBManager()
 
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData", managedObjectModel: ManagedObjectModel())
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy public var viewContext = persistentContainer.viewContext
    
    public func save() {
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("---- debug ---- save core data error = ", error)
        }
    }
    
    public func delete(object: NSManagedObject) {
        viewContext.delete(object)
    }
}

@available(iOSApplicationExtension, unavailable)
extension DBManager: DBManagerType {
    
    public func request(input: CoreDataBaseRequest) -> [CoreDataBaseRequest.T] {
        let request = input.request
        if let dataArray = try? viewContext.fetch(request) {
            return dataArray
        } else {
            return [CoreDataBaseRequest.T]()
        }
    }
}
