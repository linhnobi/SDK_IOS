//
//  Track.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/03/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
public struct Track {
    var sdk = MobioSDK.shared.configuration.sdk
    var device = Device()
    var events: [EventShared]
    var actionTime: Int
    
    enum CodingKeys: String, CodingKey {
        case sdk = "sdk"
        case device = "device"
        case events = "events"
        case actionTime = "action_time"
    }
}

@available(iOSApplicationExtension, unavailable)
extension Track: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sdk, forKey: .sdk)
        try container.encode(device, forKey: .device)
        try container.encode(events, forKey: .events)
        try container.encode(actionTime, forKey: .actionTime)
    }
}

@available(iOSApplicationExtension, unavailable)
extension Track: Decodable { }
