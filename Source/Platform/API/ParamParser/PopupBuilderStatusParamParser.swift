//
//  PopupBuilderStatusParamParser.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct PopupBuilderStatusParamParser {
        
    static func createJourney(popupData: PopupData, actionTime: Int) -> Journey {
        return Journey(popupData: popupData, actionTime: actionTime)
    }

    static func createValue(popupData: PopupData, actionTime: Int) -> FormValue {
        let journey = createJourney(popupData: popupData, actionTime: actionTime)
        return FormValue(journey: journey)
    }
    
    static func createBaseObject(popupData: PopupData, object: String, actionTime: Int) -> BaseObject {
        let value = createValue(popupData: popupData, actionTime: actionTime)
        let baseObject = BaseObject(object: object, value: value)
        return baseObject
    }
    
    static func createBaseEvent(popupData: PopupData, statusCase: WebStatusCase, actionTime: Int) -> BaseEvent {
        let baseObject = createBaseObject(popupData: popupData, object: statusCase.data.object, actionTime: actionTime)
        let baseEvent = BaseEvent(base: baseObject, type: statusCase.data.type, source: statusCase.data.source, actionTime: actionTime)
        return baseEvent
    }
    
    static func createEventArray(popupData: PopupData, statusCase: WebStatusCase, actionTime: Int) -> [EventShared] {
        let baseEvent = createBaseEvent(popupData: popupData, statusCase: statusCase, actionTime: actionTime)
        var eventArray = [EventShared]()
        eventArray.append(baseEvent)
        return eventArray
    }
    
    static func createParam(popupData: PopupData, statusCase: WebStatusCase) -> MobioSDK.Dictionary {
        let actionTime = Date().millisecondsSince1970
        let eventArray = createEventArray(popupData: popupData, statusCase: statusCase, actionTime: actionTime)
        let track = Track(events: eventArray, actionTime: actionTime)
        if let encodeResult = try? track.asDictionary() {
            return ["track": encodeResult]
        } else {
            return Dictionary()
        }
    }
}
