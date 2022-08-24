//
//  BigPicture.swift
//  MobioSDKSwift
//
//  Created by sun on 23/08/2022.
//

import Foundation

struct BigPicture: NotificationContentDataType {
    let imageURL, title, body: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title, body
    }
}
