//
//  Journey.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/03/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct Journey: Codable {
    var id: String? = ""
    var nodeID = ""
    var instanceID = ""
    var masterCampaignID = ""
    var merchantID = ""
    var popupID = ""
    var profileID = ""
    var code = ""
    var sendID = ""
    var interactiveTime: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case instanceID = "instance_id"
        case masterCampaignID = "master_campaign_id"
        case merchantID = "merchant_id"
        case popupID = "popup_id"
        case profileID = "profile_id"
        case code
        case sendID = "send_id"
        case interactiveTime = "interactive_time"
    }
    
    init(popupData: PopupData, actionTime: Int) {
        id = popupData.journeyID
        nodeID = popupData.nodeID
        instanceID = popupData.instanceID
        masterCampaignID = popupData.masterCampaignID
        merchantID = popupData.merchantID
        popupID = popupData.popupID
        profileID = popupData.profileID
        code = popupData.code
        sendID = popupData.sendID
        interactiveTime = actionTime
    }
}

@available(iOSApplicationExtension, unavailable)
extension Journey {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(masterCampaignID, forKey: .masterCampaignID)
        try container.encode(merchantID, forKey: .merchantID)
        try container.encode(popupID, forKey: .popupID)
        try container.encode(profileID, forKey: .profileID)
        try container.encode(code, forKey: .code)
        try container.encode(sendID, forKey: .sendID)
        try container.encode(interactiveTime, forKey: .interactiveTime)
    }
}
