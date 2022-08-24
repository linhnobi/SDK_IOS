//
//  ChildrenNode.swift
//  MobioSDKSwift
//
//  Created by Cuong on 1/22/22.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
@objc(ChildrenNode)
class ChildrenNode: NSManagedObject {
    @NSManaged public var id: String
    @NSManaged public var expire: Int
    @NSManaged public var complete: Bool
    @NSManaged public var type: String
    
    required convenience init(from decoder: Decoder) throws {
        self.init(context: DBManager.shared.viewContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        expire = try values.decode(Int.self, forKey: .expire)
        complete = try values.decode(Bool.self, forKey: .complete)
        type = try values.decode(String.self, forKey: .type)
    }
}

@available(iOSApplicationExtension, unavailable)
extension ChildrenNode: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case expire
        case complete
        case type
    }
}

@available(iOSApplicationExtension, unavailable)
extension ChildrenNode {
    static func <(lhs: ChildrenNode, rhs: ChildrenNode) -> Bool {
        return lhs.expire < rhs.expire
    }
}
