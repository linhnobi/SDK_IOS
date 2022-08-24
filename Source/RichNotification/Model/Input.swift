//
//  Input.swift
//  MobioSDKSwift
//
//  Created by sun on 23/08/2022.
//

import Foundation

struct Input: NotificationContentDataType {
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}
