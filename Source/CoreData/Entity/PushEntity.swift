//
//  PushEntity.swift
//  MobioSDKSwift
//
//  Created by sun on 09/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class PushEntity: NSEntityDescription {
    
    override init() {
        super.init()
        let className = NSStringFromClass(Push.self)
        name = className
        managedObjectClassName = className
        let expireAttribute = NSAttributeDescription()
        expireAttribute.name = "expire"
        expireAttribute.attributeType = .integer64AttributeType
        let nodeIDAttribute = NSAttributeDescription()
        nodeIDAttribute.name = "nodeID"
        nodeIDAttribute.attributeType = .stringAttributeType
        let prepareShowAttribute = NSAttributeDescription()
        prepareShowAttribute.name = "prepareShow"
        prepareShowAttribute.attributeType = .booleanAttributeType
        let showedAttribute = NSAttributeDescription()
        showedAttribute.name = "showed"
        showedAttribute.attributeType = .booleanAttributeType
        let timeAttribute = NSAttributeDescription()
        timeAttribute.name = "time"
        timeAttribute.attributeType = .stringAttributeType
        let typeAttribute = NSAttributeDescription()
        typeAttribute.name = "type"
        typeAttribute.attributeType = .stringAttributeType
        properties = [expireAttribute, nodeIDAttribute, prepareShowAttribute, showedAttribute, timeAttribute, typeAttribute]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
