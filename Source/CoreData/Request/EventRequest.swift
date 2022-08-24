//
//  EventRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 21/01/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
public class EventRequest: CoreDataBaseRequest {
    
    init() {
        let sortDescriptors = EventRequest.makeSortDescriptor(key: "expire", ascending: true)
        super.init(className: Event.self, sortDescriptors: sortDescriptors)
    }
}

@available(iOSApplicationExtension, unavailable)
extension EventRequest: CoreDataSortable { }
