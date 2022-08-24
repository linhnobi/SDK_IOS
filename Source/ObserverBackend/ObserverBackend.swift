//
//  ObserverBackend.swift
//  ExampleProject
//
//  Created by Sun on 21/12/2021.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
final class ObserverBackend {
    
    // MARK: - Define
    typealias PassEvent = (Event) -> ()
    
    var dataEventArray = [Event]()
    var dataPushArray = [Push]()
    let useCase = ObserverBackendUseCase()
    let pushRepository = PushRepository(manager: DBManager.shared)
    var passEvent: PassEvent?
    let trackingManager = TrackingManager()

    init() {
        setupData()
    }
}

// MARK: - Setup Data
@available(iOSApplicationExtension, unavailable)
extension ObserverBackend {
    
    private func setupData() {
        dataEventArray = useCase.getEventArray()
        dataPushArray = useCase.getPushDataArray()
    }

    func startListenEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(listenEvent),
                                               name: .sendEvent,
                                               object: nil)
    }
    
    @objc func listenEvent(_ notification: Notification) {
        if let event = notification.object as? MobioSDK.Dictionary {
            observerLogic(clientEvent: event)
        }
    }
    
    private func observerLogic(clientEvent: MobioSDK.Dictionary) {
        let dataPushSatisfyArray = findDataPushSatisfyArray(clientEvent: clientEvent)
        showFirstPopup(dataPushSatisfyArray: dataPushSatisfyArray)
    }
}

// MARK: - Processing Data
@available(iOSApplicationExtension, unavailable)
extension ObserverBackend {
    
    private func findEventSatisfy(clientEvent: MobioSDK.Dictionary) -> Event? {
        let eventSatisfy = dataEventArray.first { event -> Bool in
            let serverEvent = event.eventData
            return compareEvent(serverEvent: serverEvent, clientEvent: clientEvent)
        }
        return eventSatisfy
    }
    
    private func findDataPushSatisfyArray(clientEvent: MobioSDK.Dictionary) -> [Push] {
        if let eventSatisfy = findEventSatisfy(clientEvent: clientEvent) {
            passEvent?(eventSatisfy)
            return eventSatisfy.findDataPushArray()
        } else {
            return pushRepository.getList(by: "showed == NO && prepareShow == YES")
        }
    }

    private func compareEvent(serverEvent: MobioSDK.Dictionary, clientEvent: MobioSDK.Dictionary) -> Bool {
        let arrayKey = Array(serverEvent.keys)
        for i in 0..<arrayKey.count {
            let key = arrayKey[i]
            let unwrapServerEvent = serverEvent[key] ?? (Any).self
            let unwrapClientEvent = clientEvent[key] ?? (Any).self
            let serverValue = String(describing: unwrapServerEvent)
            let clientValue = String(describing: unwrapClientEvent)
            if serverValue != clientValue {
                return false
            }
        }
        return true
    }
}

// MARK: - View
@available(iOSApplicationExtension, unavailable)
extension ObserverBackend {

    private func showPopup(dataPush: Push) {
        let popupManager = PopupManager.shared
        popupManager.push = dataPush
        popupManager.showAccepPopup()
    }
    
    private func showFirstPopup(dataPushSatisfyArray: [Push]) {
        guard let firstItem = dataPushSatisfyArray.first else { return }
        showPopup(dataPush: firstItem)
    }
}

@available(iOSApplicationExtension, unavailable)
extension ObserverBackend: Trackable {
    func track(name: String, properties: MobioSDK.Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
}
