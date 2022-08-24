//
//  EventShared.swift
//  MobioSDKSwift
//
//  Created by sun on 25/04/2022.
//

import Foundation

class EventShared: Codable {
    var source: String
    var actionTime: Int
    var type: String
    
    init(type: String, source: String, actionTime: Int) {
        self.type = type
        self.source = source
        self.actionTime = actionTime
    }
    
    enum CodingKeys: String, CodingKey {
        case source
        case actionTime = "action_time"
        case type
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(actionTime, forKey: .actionTime)
        try container.encode(type, forKey: .type)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(String.self, forKey: .source)
        actionTime = try container.decode(Int.self, forKey: .actionTime)
        type = try container.decode(String.self, forKey: .type)
    }
}
