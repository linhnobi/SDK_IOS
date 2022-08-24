//
//  DataResponse.swift
//  MobioSDKSwift
//
//  Created by Sun on 29/04/2022.
//

import Foundation

struct DataResponse: Codable {
    let uID, dID, tID: String?
    let deviceID, profileID: String?

    enum CodingKeys: String, CodingKey {
        case uID = "u_id"
        case dID = "d_id"
        case tID = "t_id"
        case deviceID = "device_id"
        case profileID = "profile_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uID = try container.decodeIfPresent(String.self, forKey: .uID)
        dID = try container.decodeIfPresent(String.self, forKey: .dID)
        tID = try container.decodeIfPresent(String.self, forKey: .tID)
        deviceID = try container.decodeIfPresent(String.self, forKey: .deviceID)
        profileID = try container.decodeIfPresent(String.self, forKey: .profileID)
        saveDID()
    }
    
    func saveDID() {
        if let dID = dID {
            UserDefaultManager.set(value: dID, forKey: .dID)
        }
    }
}
