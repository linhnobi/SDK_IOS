//
//  DynamicObject.swift
//  MobioSDKSwift
//
//  Created by Sun on 27/04/2022.
//

import Foundation

class DynamicObject: Codable {
    let eventKey: String
    
    init(eventKey: String) {
        self.eventKey = eventKey
    }

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        eventKey = try container.decode(String.self, forKey: .eventKey)
    }
}
