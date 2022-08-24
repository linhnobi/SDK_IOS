//
//  Device.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/03/2022.
//

import Foundation

protocol DeviceType {
    var type: String { get }
    var channel: String { get }
    var dId: String { get }
    var tId: String { get }
    var uId: String { get }
}

struct Device: DeviceType, Codable {

    var type = "mobile"
    var channel = "app"
    var dId = UserDefaultManager.getString(forKey: .dID)
    var tId = IOSVendorSystem.current.identifierForVendor
    var uId = ""
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case channel = "channel"
        case dId = "d_id"
        case tId = "t_id"
        case uId = "u_id"
    }
}
