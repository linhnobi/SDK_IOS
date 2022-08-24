//
//  Aps.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import Foundation

struct Aps: Codable {
    let alert: Alert
    let richNotificationContentData: RichNotificationContentData?
    
    enum CodingKeys: String, CodingKey {
        case alert
        case richNotificationContentData = "rich_notification_content_data"
    }
}
