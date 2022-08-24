//
//  EventEntity.swift
//  MobioSDKSwift
//
//  Created by sun on 09/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class EventEntity: NSEntityDescription {
    
    override init() {
        super.init()
        let className = NSStringFromClass(Event.self)
        name = className
        managedObjectClassName = className
        let eventDataAttribute = NSAttributeDescription()
        eventDataAttribute.name = "eventData"
        eventDataAttribute.attributeType = .transformableAttributeType
        eventDataAttribute.valueTransformerName = "NSSecureUnarchiveFromData"
        let eventKeyAttribute = NSAttributeDescription()
        eventKeyAttribute.name = "eventKey"
        eventKeyAttribute.attributeType = .stringAttributeType
        let nodeIDAttribute = NSAttributeDescription()
        nodeIDAttribute.name = "nodeID"
        nodeIDAttribute.attributeType = .stringAttributeType
        properties = [eventDataAttribute, eventKeyAttribute, nodeIDAttribute]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
