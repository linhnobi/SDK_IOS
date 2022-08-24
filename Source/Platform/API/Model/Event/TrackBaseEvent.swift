//
//  TrackBaseEvent.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/05/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
class TrackBaseEvent: EventShared {
    
    var base: TrackBaseObject!
    
    init(base: TrackBaseObject, type: String, source: String, actionTime: Int) {
        super.init(type: type, source: source, actionTime: actionTime)
        self.base = base
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    enum CodingKeys: String, CodingKey {
        case base
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(base, forKey: .base)
    }
}
