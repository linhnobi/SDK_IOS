//
//  NotificationDevice.swift
//  MobioSDKSwift
//
//  Created by Sun on 21/04/2022.
//

import Foundation

struct NotificationDevice: DeviceType {
    
    var dId = UserDefaultManager.getString(forKey: .dID)
    var tId = IOSVendorSystem.current.identifierForVendor
    var uId = ""
    var type = "mobile"
    var channel = "app"
    var os = OS()
    var network = Network()
    var screen = ScreenRequest()
    var locale = Locale.preferredLanguageCode
    var timezone = TimeZone.current.identifier
    var app = App()
    
    enum CodingKeys: String, CodingKey {
        case dId = "d_id"
        case tId = "t_id"
        case uId = "u_id"
        case type, channel, os, network, screen, locale, timezone, app
    }
}

extension NotificationDevice: Decodable {
     
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dId = try container.decode(String.self, forKey: .dId)
        tId = try container.decode(String.self, forKey: .tId)
        uId = try container.decode(String.self, forKey: .uId)
        type = try container.decode(String.self, forKey: .type)
        channel = try container.decode(String.self, forKey: .channel)
        os = try container.decode(OS.self, forKey: .os)
        network = try container.decode(Network.self, forKey: .network)
        screen = try container.decode(ScreenRequest.self, forKey: .screen)
        locale = try container.decode(String.self, forKey: .locale)
        timezone = try container.decode(String.self, forKey: .timezone)
        app = try container.decode(App.self, forKey: .app)
    }
}

extension NotificationDevice: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dId, forKey: .dId)
        try container.encode(tId, forKey: .tId)
        try container.encode(uId, forKey: .uId)
        try container.encode(type, forKey: .type)
        try container.encode(channel, forKey: .channel)
        try container.encode(os, forKey: .os)
        try container.encode(network, forKey: .network)
        try container.encode(screen, forKey: .screen)
        try container.encode(locale, forKey: .locale)
        try container.encode(timezone, forKey: .timezone)
        try container.encode(app, forKey: .app)
    }
}
 
