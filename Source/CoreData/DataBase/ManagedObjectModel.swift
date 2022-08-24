//
//  ManagedObjectModel.swift
//  MobioSDKSwift
//
//  Created by Sun on 08/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class ManagedObjectModel: NSManagedObjectModel {
    
    override init() {
        super.init()
        var entityArray = [NSEntityDescription]()
        let eventChildrenNodeRelationship = createEventChildrenNodeRelationship()
        entityArray.append(contentsOf: eventChildrenNodeRelationship)
        let pushNotiResponseRelationship = createPushNotiResponseRelationship()
        entityArray.append(contentsOf: pushNotiResponseRelationship)
        entityArray.append(FailAPIEntity())
        entities = entityArray
    }
    
    func createEventChildrenNodeRelationship() -> [NSEntityDescription] {
        let eventEntity = EventEntity()
        let childrenNodeEntity = ChildrenNodeEntity()
        let eventRelation = NSRelationshipDescription()
        let childrenNodesRelation = NSRelationshipDescription()
        eventRelation.name = "event"
        eventRelation.destinationEntity = eventEntity
        eventRelation.minCount = 0
        eventRelation.maxCount = 1
        eventRelation.deleteRule = .nullifyDeleteRule
        eventRelation.inverseRelationship = childrenNodesRelation
        childrenNodesRelation.name = "childrenNode"
        childrenNodesRelation.destinationEntity = childrenNodeEntity
        childrenNodesRelation.minCount = 0
        childrenNodesRelation.maxCount = 0
        childrenNodesRelation.deleteRule = .cascadeDeleteRule
        childrenNodesRelation.inverseRelationship = eventRelation
        eventEntity.properties.append(childrenNodesRelation)
        childrenNodeEntity.properties.append(eventRelation)
        return [eventEntity, childrenNodeEntity]
    }
    
    func createPushNotiResponseRelationship() -> [NSEntityDescription] {
        let pushEntity = PushEntity()
        let notiResponseEntity = NotiResponseEntiry()
        let pushRelation = NSRelationshipDescription()
        let notiResponseRelation = NSRelationshipDescription()
        pushRelation.name = "push"
        pushRelation.destinationEntity = pushEntity
        pushRelation.minCount = 0
        pushRelation.maxCount = 1
        pushRelation.deleteRule = .nullifyDeleteRule
        pushRelation.inverseRelationship = notiResponseRelation
        notiResponseRelation.name = "notiResponse"
        notiResponseRelation.destinationEntity = notiResponseEntity
        notiResponseRelation.minCount = 0
        notiResponseRelation.maxCount = 1
        notiResponseRelation.deleteRule = .cascadeDeleteRule
        notiResponseRelation.inverseRelationship = pushRelation
        pushEntity.properties.append(notiResponseRelation)
        notiResponseEntity.properties.append(pushRelation)
        return [pushEntity, notiResponseEntity]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
