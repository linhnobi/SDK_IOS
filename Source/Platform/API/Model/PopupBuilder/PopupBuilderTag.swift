//
//  PopupBuilderTag.swift
//  MobioSDKSwift
//
//  Created by sun on 24/04/2022.
//

import Foundation

struct PopupBuilderTag: Codable {
    let tagType: Int?
    let tagName, tagID: String

    enum CodingKeys: String, CodingKey {
        case tagType = "tag_type"
        case tagName = "tag_name"
        case tagID = "tag_id"
    }
}
