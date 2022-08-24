//
//  TrackBaseObject.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/05/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct TrackBaseObject: Codable {
    var object: String
    var value: MobioSDK.Dictionary
    
    enum CodingKeys: String, CodingKey {
        case object = "object"
        case value = "value"
    }
    
    init(object: String, value: MobioSDK.Dictionary) {
        self.object = object
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        object = try container.decode(String.self, forKey: .object)
        value = try container.decode(MobioSDK.Dictionary.self, forKey: .value)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(object, forKey: .object)
        try container.encode(value, forKey: .value)
    }
}
