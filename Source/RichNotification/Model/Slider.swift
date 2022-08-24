//
//  Slider.swift
//  MobioSDKSwift
//
//  Created by sun on 23/08/2022.
//

import Foundation

struct Slider: NotificationContentDataType {
    let imageStringArray: [String]
    let timeStep: TimeInterval?
    
    enum CodingKeys: String, CodingKey {
        case imageStringArray
        case timeStep
    }
}
