//
//  RemoteNotificationData.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct RemoteNotificationData: Codable {
    let data: PopupData?
    let aps: Aps
    let alert: Alert?
    let badge: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case aps
        case alert
        case badge
    }
}
