//
//  EventRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 21/01/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol EventRepositoryType {
    func save(_ dataEvent: Event)
}

@available(iOSApplicationExtension, unavailable)
final class EventRepository {
    
    typealias T = Event
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
}

@available(iOSApplicationExtension, unavailable)
extension EventRepository: CoreDataBaseRepositoryType {
    
    func getList() -> [T] {
        let dataEventRequest = EventRequest()
        return getArrayData(input: dataEventRequest)
    }
}

@available(iOSApplicationExtension, unavailable)
extension EventRepository: EventRepositoryType {
    
    func save(_ dataEvent: T) {
        manager.save()
    }
}
