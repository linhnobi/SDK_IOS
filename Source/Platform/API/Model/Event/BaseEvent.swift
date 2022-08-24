//
//  BaseEvent.swift
//  MobioSDKSwift
//
//  Created by Sun on 25/04/2022.
//

import Foundation

class BaseEvent: EventShared {
    
    var base: BaseObject!
    var includedReport: Int?
    
    init(base: BaseObject, type: String, includedReport: Int? = nil, source: String, actionTime: Int) {
        super.init(type: type, source: source, actionTime: actionTime)
        self.base = base
        self.includedReport = includedReport
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    enum CodingKeys: String, CodingKey {
        case base
        case includedReport = "included_report"
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(base, forKey: .base)
        try container.encodeIfPresent(includedReport, forKey: .includedReport)
    }
}
