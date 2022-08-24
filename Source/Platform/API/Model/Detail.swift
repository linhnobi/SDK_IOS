//
//  Detail.swift
//  MobioSDKSwift
//
//  Created by Mobio on 01/04/2022.
//

import Foundation

struct Detail: Codable {
    let dID = UserDefaultManager.getString(forKey: .dID)
    let tID = IOSVendorSystem.current.identifierForVendor
    let uID = ""
    let type = "mobile"
    let channel = "app"
    let os = OS()
    let network = Network()
    let screen = ScreenRequest()
    let locale = Locale.preferredLanguageCode
    let timezone = TimeZone.current.identifier
    let app = App()

    enum CodingKeys: String, CodingKey {
        case dID = "d_id"
        case tID = "t_id"
        case uID = "u_id"
        case type, channel, os, network, screen, locale, timezone, app
    }
}
