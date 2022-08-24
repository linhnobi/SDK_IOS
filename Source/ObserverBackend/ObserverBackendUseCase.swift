//
//  ObserverBackendUseCase.swift
//  MobioSDKSwift
//
//  Created by Sun on 20/01/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol ObserverBackendUseCaseType {
    func getEventArray() -> [Event]
    func getPushDataArray() -> [Push]
}

struct ObserverBackendUseCase {
}

@available(iOSApplicationExtension, unavailable)
extension ObserverBackendUseCase: ObserverBackendUseCaseType {
    
    func getEventArray() -> [Event] {
        let data = Data(eventJson.utf8)
        if let eventResponse = JSONManager.decode(EventResponse.self, from: data) {
            return eventResponse.events
        } else {
            return [Event]()
        }
    }
    
    func getPushDataArray() -> [Push] {
        let data = Data(pushJson.utf8)
        if let dataPushResponse = JSONManager.decode(PushResponse.self, from: data) {
            return dataPushResponse.pushes
        } else {
            return [Push]()
        }
    }
}
