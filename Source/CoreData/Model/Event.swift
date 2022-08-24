//
//  Event.swift
//  MobioSDKSwift
//
//  Created by Cuong on 1/22/22.
//

import Foundation
import CoreData

@available(iOSApplicationExtension, unavailable)
@objc(Event)
class Event: NSManagedObject {
    
    @NSManaged public var childrenNode: Set<ChildrenNode>
    @NSManaged public var nodeID: String
    @NSManaged public var eventKey: String
    @NSManaged public var eventData: MobioSDK.Dictionary
    
    let pushRepository = PushRepository(manager: DBManager.shared)

    public required convenience init(from decoder: Decoder) throws {
        self.init(context: DBManager.shared.viewContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        childrenNode = try values.decode(Set<ChildrenNode>.self, forKey: .childrenNode)
        eventKey = try values.decode(String.self, forKey: .eventKey)
        nodeID = try values.decode(String.self, forKey: .nodeID)
        eventData = try values.decode(MobioSDK.Dictionary.self, forKey: .eventData)
    }
}

@available(iOSApplicationExtension, unavailable)
extension Event: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case childrenNode = "children_node"
        case nodeID = "node_id"
        case eventKey = "event_key"
        case eventData = "event_data"
    }
}

@available(iOSApplicationExtension, unavailable)
extension Event {
    
    @objc(addChildrenNodeObject:)
    @NSManaged public func addToChildrenNode(_ value: ChildrenNode)
    
    @objc(removeChildrenNodeObject:)
    @NSManaged public func removeFromChildrenNode(_ value: ChildrenNode)
    
    @objc(addChildrenNode:)
    @NSManaged public func addToChildrenNode(_ values: Set<ChildrenNode>)
    
    @objc(removeChildrenNode:)
    @NSManaged public func removeFromChildrenNode(_ values: Set<ChildrenNode>)
}

@available(iOSApplicationExtension, unavailable)
extension Event {
        
    func findDataPushArray() -> [Push] {
        let dataPushArraySelected = childrenNode
            .compactMap { childrenNode in
            findPushData(with: childrenNode.id)
        }
        return dataPushArraySelected.sorted(by: <)
    }
    
    private func findPushData(with id: String) -> Push? {
        let pushArray = pushRepository.getList(by: "showed == NO")
        let push = pushArray.first { push in
            id == push.nodeID
        }
        push?.prepareShow = true
        return push
    }
}
