//
//  SubmitFormDynamicObject.swift
//  MobioSDKSwift
//
//  Created by Sun on 14/07/2022.
//

import Foundation

class SubmitFormDynamicObject: DynamicObject {
    var eventData: DynamicEventData
    
    init(eventData: DynamicEventData, eventKey: String) {
        self.eventData = eventData
        super.init(eventKey: eventKey)
    }

    enum CodingKeys: String, CodingKey {
        case eventData = "event_data"
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(eventData.self, forKey: .eventData)
        try super.encode(to: encoder)
    }
}
