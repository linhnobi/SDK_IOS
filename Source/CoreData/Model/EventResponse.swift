//
//  EventResponse.swift
//  MobioSDKSwift
//
//  Created by Cuong on 1/22/22.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct EventResponse: Decodable {
    let events: [Event]
}
