//
//  Push.swift
//  MobioSDKSwift
//
//  Created by Sun on 11/01/2022.
//

import Foundation
import CoreData

@available(iOSApplicationExtension, unavailable)
@objc(Push)
public class Push: NSManagedObject {
    @NSManaged public var type, time: String
    @NSManaged public var expire: Int
    @NSManaged public var nodeID: String
    @NSManaged public var notiResponse: NotiResponse
    @NSManaged public var showed: Bool
    @NSManaged public var prepareShow: Bool
    
    public required convenience init(from decoder: Decoder) throws {
        self.init(context: DBManager.shared.viewContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
        time = try values.decode(String.self, forKey: .time)
        expire = try values.decode(Int.self, forKey: .expire)
        nodeID = try values.decode(String.self, forKey: .nodeID)
        notiResponse = try values.decode(NotiResponse.self, forKey: .notiResponse)
        showed = try values.decode(Bool.self, forKey: .showed)
        prepareShow = try values.decode(Bool.self, forKey: .prepareShow)
    }
}

@available(iOSApplicationExtension, unavailable)
extension Push: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case type, time
        case jbID = "jb_id"
        case expire
        case nodeCode = "node_code"
        case nodeID = "node_id"
        case nodeName = "node_name"
        case notiResponse = "noti_response"
        case showed
        case prepareShow
    }
}

@available(iOSApplicationExtension, unavailable)
extension Push: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(time, forKey: .time)
        try container.encode(expire, forKey: .expire)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(notiResponse, forKey: .notiResponse)
        try container.encode(showed, forKey: .showed)
        try container.encode(prepareShow, forKey: .prepareShow)
    }
}

@available(iOSApplicationExtension, unavailable)
extension Push {
    
    static func <(lhs: Push, rhs: Push) -> Bool {
        lhs.expire < rhs.expire
    }
}
