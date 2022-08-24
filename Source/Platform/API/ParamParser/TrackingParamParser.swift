//
//  TrackingParamParser.swift
//  MobioSDKSwift
//
//  Created by Sun on 30/03/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct TrackingParamParser {
    
    static func createTrackBaseObject(value: MobioSDK.Dictionary) -> TrackBaseObject {
        let baseObject = TrackBaseObject(object: "screen", value: value)
        return baseObject
    }
    
    static func createTrackBaseEvent(value: MobioSDK.Dictionary, actionTime: Int, type: String) -> TrackBaseEvent {
        let trackBaseObject = createTrackBaseObject(value: value)
        let trackBaseEvent = TrackBaseEvent(base: trackBaseObject, type: type, source: "digienty", actionTime: actionTime)
        return trackBaseEvent
    }
    
    static func createTrackDynamicEvent(value: MobioSDK.Dictionary, actionTime: Int, event: String) -> DynamicEvent {
        let trackDynamicObject = TrackDynamicObject(eventData: value, eventKey: event)
        let trackDynamicEvent = DynamicEvent(dynamics: [trackDynamicObject], source: "digienty", actionTime: actionTime)
        return trackDynamicEvent
    }
    
    static func createEventArray(value: MobioSDK.Dictionary, actionTime: Int, type: String, event: String) -> [EventShared] {
        let trackDynamicEvent = createTrackDynamicEvent(value: value, actionTime: actionTime, event: event)
        var eventArray = [EventShared]()
        eventArray.append(trackDynamicEvent)
        return eventArray
    }
    
    static func createParam(event: String, properties: MobioSDK.Dictionary, type: String) -> MobioSDK.Dictionary {
        let actionTime = Date().millisecondsSince1970
        let eventArray = createEventArray(value: properties, actionTime: actionTime, type: type, event: event)
        let track = Track(events: eventArray, actionTime: actionTime)
        if let encodeResult = try? track.asDictionary() {
            return ["track": encodeResult]
        } else {
            return Dictionary()
        }
    }
}
