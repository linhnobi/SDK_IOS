//
//  TrackDynamicObject.swift
//  MobioSDKSwift
//
//  Created by Sun on 13/07/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
class TrackDynamicObject: DynamicObject {
    var eventData: MobioSDK.Dictionary
    
    init(eventData: MobioSDK.Dictionary, eventKey: String) {
        self.eventData = eventData
        super.init(eventKey: eventKey)
    }
    
    enum CodingKeys: String, CodingKey {
        case eventData = "event_data"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(eventData, forKey: .eventData)
        try super.encode(to: encoder)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        eventData = try container.decode(MobioSDK.Dictionary.self, forKey: .eventData)
        try super.init(from: decoder)
    }
}
