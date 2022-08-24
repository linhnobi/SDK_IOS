//
//  PopupData.swift
//  MobioSDKSwift
//
//  Created by Sun on 04/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct PopupData: Codable {
    let profileID: String
    let journeyID: String?
    let nodeID, masterCampaignID: String
    let code, popupURL, sendID, popupType: String
    let merchantID, popupID, instanceID: String
    let profileInfo: MobioSDK.Dictionary
    let popupPosition: String?
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profile_id"
        case journeyID = "journey_id"
        case nodeID = "node_id"
        case masterCampaignID = "master_campaign_id"
        case code
        case popupURL = "popup_url"
        case sendID = "send_id"
        case popupType = "popup_type"
        case merchantID = "merchant_id"
        case popupID = "popup_id"
        case instanceID = "instance_id"
        case profileInfo = "profile_info"
        case popupPosition = "popup_position"
    }
}

@available(iOSApplicationExtension, unavailable)
extension PopupData {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        profileInfo = try container.decode(MobioSDK.Dictionary.self, forKey: .profileInfo)
        popupType = try container.decode(String.self, forKey: .popupType)
        popupID = try container.decode(String.self, forKey: .popupID)
        popupURL = try container.decode(String.self, forKey: .popupURL)
        merchantID = try container.decode(String.self, forKey: .merchantID)
        masterCampaignID = try container.decode(String.self, forKey: .masterCampaignID)
        profileID = try container.decode(String.self, forKey: .profileID)
        journeyID = try container.decodeIfPresent(String.self, forKey: .journeyID)
        nodeID = try container.decode(String.self, forKey: .nodeID)
        sendID = try container.decode(String.self, forKey: .sendID)
        code = try container.decode(String.self, forKey: .code)
        instanceID = try container.decode(String.self, forKey: .instanceID)
        popupPosition = try container.decodeIfPresent(String.self, forKey: .popupPosition)
    }
}

@available(iOSApplicationExtension, unavailable)
extension PopupData {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(profileInfo, forKey: .profileInfo)
        try container.encode(popupType, forKey: .popupType)
        try container.encode(popupID, forKey: .popupID)
        try container.encode(popupURL, forKey: .popupURL)
        try container.encode(merchantID, forKey: .merchantID)
        try container.encode(masterCampaignID, forKey: .masterCampaignID)
        try container.encode(profileID, forKey: .profileID)
        try container.encode(journeyID, forKey: .journeyID)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(code, forKey: .code)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(popupPosition, forKey: .popupPosition)
    }
}
