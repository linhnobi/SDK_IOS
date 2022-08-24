//
//  URLs.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct URLs {
    static let baseUrl = MobioSDK.shared.configuration.baseUrlType.urlString
    static let pathUrl = "digienty/web/api/v1.1/"
    static let trackUrl = baseUrl + pathUrl + "track.json"
    static let deviceUrl = baseUrl + pathUrl + "device.json"
    static let notificationUrl = baseUrl + pathUrl + "device/notification.json"
}
