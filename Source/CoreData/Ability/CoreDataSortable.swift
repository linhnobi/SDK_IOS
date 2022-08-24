//
//  CoreDataSortable.swift
//  MobioSDKSwift
//
//  Created by Sun on 17/02/2022.
//

import Foundation

protocol CoreDataSortable {
    
    static func makeSortDescriptor(key: String, ascending: Bool) -> [NSSortDescriptor] 
}

extension CoreDataSortable {
    
    static func makeSortDescriptor(key: String, ascending: Bool) -> [NSSortDescriptor] {
        let expireSort = NSSortDescriptor(key: key, ascending: ascending)
        return [expireSort]
    }
}
