//
//  CountDown.swift
//  MobioSDKSwift
//
//  Created by sun on 23/08/2022.
//

import Foundation

struct CountDown: NotificationContentDataType {
    let imageURL, title, body: String
    let time: TimeInterval
    var endDate: Date {
        return Date(timeIntervalSince1970: time)
    }
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title, body, time
    }
}
