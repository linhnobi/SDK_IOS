//
//  Dynamic.swift
//  MobioSDKSwift
//
//  Created by Sun on 30/03/2022.
//

import Foundation

struct Dynamic: Codable {
    var eventKey: String
    var enventData = EventDataTracking()
    var includedReport: Bool
    
    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case enventData = "event_data"
        case includedReport
    }
}
