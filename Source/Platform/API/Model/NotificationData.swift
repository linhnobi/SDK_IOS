//
//  NotificationData.swift
//  MobioSDKSwift
//
//  Created by Sun on 21/04/2022.
//

import Foundation

struct NotificationData: Codable {
    let sdk: SDK
    let device: NotificationDevice
    let detail: NotificationDetail
    let actionTime = Date().millisecondsSince1970

    enum CodingKeys: String, CodingKey {
        case sdk, device, detail
        case actionTime = "action_time"
    }
}
