//
//  Rating.swift
//  MobioSDKSwift
//
//  Created by sun on 23/08/2022.
//

import Foundation

struct Rating: NotificationContentDataType {
    let imageURL: String
    let emptyStarURL: String
    let fullStarURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case emptyStarURL
        case fullStarURL
    }
}
