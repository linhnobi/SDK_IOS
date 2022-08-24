//
//  CoreDataBaseRequest.swift
//
//  Created by Sun on 23/12/2021.
//

import CoreData

@objc public protocol CoreDataBaseRequestType {
    typealias T = NSManagedObject
    var request: NSFetchRequest<T> { get }
    @objc optional var expireSort: NSSortDescriptor { get set }
}

public class CoreDataBaseRequest: CoreDataBaseRequestType {
       
    public var request = NSFetchRequest<T>()
    var predicate: NSPredicate?
    
    init(className: T.Type, format: String? = nil, sortDescriptors: [NSSortDescriptor]? = nil) {
        makeRequest(className: className, format: format, sortDescriptors: sortDescriptors)
    }
}

extension CoreDataBaseRequest {
    
    func makeRequest(className: T.Type, format: String? = nil,
                     sortDescriptors: [NSSortDescriptor]? = nil) {
        let entityName = String(describing: className)
        request = NSFetchRequest<T>(entityName: entityName)
        request.predicate = makePredicate(format: format)
        request.sortDescriptors = sortDescriptors
    }
    
    private func makePredicate(format: String?) -> NSPredicate? {
        if let format = format {
            return NSPredicate(format: format)
        } else {
            return nil
        }
    }
}
