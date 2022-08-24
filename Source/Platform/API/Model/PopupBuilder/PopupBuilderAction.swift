//
//  PopupBuilderAction.swift
//  MobioSDKSwift
//
//  Created by sun on 24/04/2022.
//

import Foundation

struct PopupBuilderAction: Codable {
    let actionName: String?
    let actionKey: String
    let isOpenTap: Bool?
    let redirectUrl: String?
    let downloadUrl: String?
    let downloadType: String?
}
