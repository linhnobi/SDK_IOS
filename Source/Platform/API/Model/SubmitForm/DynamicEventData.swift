//
//  DynamicEventData.swift
//  MobioSDKSwift
//
//  Created by Sun on 27/04/2022.
//

import Foundation

struct DynamicEventData: Codable {
    let actionTime: Int
    
    init(actionTime: Int) {
        self.actionTime = actionTime
    }

    enum CodingKeys: String, CodingKey {
        case actionTime = "action_time"
    }
}
