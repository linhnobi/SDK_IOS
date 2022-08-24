//
//  Alert.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import Foundation

struct Alert: Codable {
    let body: String?
    let title: String?
    let backgroundImage: String?
    let contentType: String?
    let status: Bool?

    enum CodingKeys: String, CodingKey {
        case body
        case title
        case backgroundImage = "background_image"
        case contentType = "content_type"
        case status
    }
}
