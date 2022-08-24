//
//  DynamicEvent.swift
//  MobioSDKSwift
//
//  Created by Sun on 25/04/2022.
//

import Foundation

class DynamicEvent: EventShared {
    var dynamics: [DynamicObject]!
    
    init(dynamics: [DynamicObject], source: String, actionTime: Int) {
        super.init(type: "dynamic", source: source, actionTime: actionTime)
        self.dynamics = dynamics
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dynamics = try container.decode([DynamicObject].self, forKey: .dynamics)
        try super.init(from: decoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case dynamics
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dynamics, forKey: .dynamics)
    }
}
