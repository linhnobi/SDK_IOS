//
//  CoreDataBaseRepositoryType.swift
//
//  Created by Sun on 15/12/2021.
//

import CoreData

protocol CoreDataBaseRepositoryType {
    
    associatedtype T
    var manager: DBManagerType! { get }
    init(manager: DBManagerType)
    func getList() -> [T]
    func delete(object: NSManagedObject)
    func save()
}

extension CoreDataBaseRepositoryType {
    
    var entityName: String {
        return String(describing: T.self)
    }
    
    func getArrayData(input: CoreDataBaseRequest) -> [T] {
        if let dataArray = manager.request(input: input) as? [T] {
            return dataArray
        } else {
            return [T]()
        }
    }
    
    func delete(object: NSManagedObject) {
        manager.delete(object: object)
    }
    
    func save() {
        manager.save()
    }
}
