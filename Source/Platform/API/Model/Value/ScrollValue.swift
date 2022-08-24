//
//  ScrollValue.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/05/2022.
//

import Foundation

class ScrollValue: Value {
    
    var screenName: String
    var percentageScroll: Int
    var direction, unit: String
    
    init(screenName: String, percentageScroll: Int, direction: String, unit: String) {
        self.screenName = screenName
        self.percentageScroll = percentageScroll
        self.direction = direction
        self.unit = unit
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    enum CodingKeys: String, CodingKey {
        case screenName
        case percentageScroll = "percentage_scroll"
        case direction, unit
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(screenName, forKey: .screenName)
        try container.encode(percentageScroll, forKey: .percentageScroll)
        try container.encode(direction, forKey: .direction)
        try container.encode(unit, forKey: .unit)
    }
}
