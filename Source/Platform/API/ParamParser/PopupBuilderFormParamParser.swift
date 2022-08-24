//
//  PopupBuilderFormParamParser.swift
//  MobioSDKSwift
//
//  Created by Sun on 25/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct PopupBuilderFormParamParser {
    
    static func createJourney(popupData: PopupData, actionTime: Int) -> Journey {
        return Journey(popupData: popupData, actionTime: actionTime)
    }
    
    static func createInputFields(actionData: PopupBuilderActionData) -> MobioSDK.Dictionary? {
        guard let formData = actionData.formData else { return nil }
        let fields = formData.fields
        return fields
    }
    
    static func createButton(actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase) -> Button? {
        return actionData.button
    }
    
    static func createTagArray(actionData: PopupBuilderActionData) -> [PopupBuilderTag]? {
        return actionData.tags
    }
    
    static func createValue(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase, actionTime: Int) -> Value {
        let inputFields = createInputFields(actionData: actionData)
        let button = createButton(actionData: actionData, submitFormCase: submitFormCase)
        let tags = createTagArray(actionData: actionData)
        let journey = createJourney(popupData: popupData, actionTime: actionTime)
        return FormValue(journey: journey, button: button, tags: tags, inputFields: inputFields)
    }
    
    static func createBaseObject(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase, actionTime: Int) -> BaseObject {
        let value = createValue(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase, actionTime: actionTime)
        let baseObject = BaseObject(object: submitFormCase.data.object, value: value)
        return baseObject
    }
    
    static func createBaseEvent(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase, actionTime: Int) -> BaseEvent {
        let baseObject = createBaseObject(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase, actionTime: actionTime)
        let baseEvent = BaseEvent(base: baseObject, type: submitFormCase.data.type, includedReport: actionData.includedReport, source: submitFormCase.data.source, actionTime: actionTime)
        return baseEvent
    }
    
    static func createDynamicEvent(actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase, actionTime: Int) -> DynamicEvent? {
        if let events = actionData.events, !events.isEmpty {
            let dynamics = events.map { popupBuilderEvent -> SubmitFormDynamicObject in
                let eventData = DynamicEventData(actionTime: actionTime)
                return SubmitFormDynamicObject(eventData: eventData, eventKey: popupBuilderEvent.eventKey)
            }
            let dynamicEvent = DynamicEvent(dynamics: dynamics, source: submitFormCase.data.source, actionTime: actionTime)
            return dynamicEvent
        } else {
            return nil
        }
    }
    
    static func createEventArray(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase, actionTime: Int) -> [EventShared] {
        let baseEvent = createBaseEvent(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase, actionTime: actionTime)
        var eventArray = [EventShared]()
        eventArray.append(baseEvent)
        if let dynamicEvent = createDynamicEvent(actionData: actionData, submitFormCase: submitFormCase, actionTime: actionTime) {
            eventArray.append(dynamicEvent)
        }
        return eventArray
    }
    
    static func createParam(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase) -> MobioSDK.Dictionary {
        let actionTime = Date().millisecondsSince1970
        let eventArray = createEventArray(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase, actionTime: actionTime)
        let track = Track(events: eventArray, actionTime: actionTime)
        if let encodeResult = try? track.asDictionary() {
            return ["track": encodeResult]
        } else {
            return Dictionary()
        }
    }
}
