//
//  Identity.swift
//  MobioSDKSwift
//
//  Created by Sun on 01/04/2022.
//

import Foundation

struct Identity: Codable {
    let sdk: SDK
    let device: Detail
    let actionTime = Date().millisecondsSince1970

    enum CodingKeys: String, CodingKey {
        case sdk, device
        case actionTime = "action_time"
    }
}
