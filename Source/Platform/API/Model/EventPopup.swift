//
//  EventPopup.swift
//  MobioSDKSwift
//
//  Created by Sun on 06/04/2022.
//

import Foundation

struct EventPopup {
    var eventKey: String
    var includedReport: Bool
    var eventData: EventDataTracking
}

extension EventPopup: Codable { }
