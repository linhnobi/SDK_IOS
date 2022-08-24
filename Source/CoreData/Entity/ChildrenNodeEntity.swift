//
//  ChildrenNodeEntity.swift
//  MobioSDKSwift
//
//  Created by sun on 09/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class ChildrenNodeEntity: NSEntityDescription {
    
    override init() {
        super.init()
        let className = NSStringFromClass(ChildrenNode.self)
        name = className
        managedObjectClassName = className
        let completeAttribute = NSAttributeDescription()
        completeAttribute.name = "complete"
        completeAttribute.attributeType = .booleanAttributeType
        let expireAttribute = NSAttributeDescription()
        expireAttribute.name = "expire"
        expireAttribute.attributeType = .integer64AttributeType
        let idAttribute = NSAttributeDescription()
        idAttribute.name = "id"
        idAttribute.attributeType = .stringAttributeType
        let typeAttribute = NSAttributeDescription()
        typeAttribute.name = "type"
        typeAttribute.attributeType = .stringAttributeType
        properties = [completeAttribute, expireAttribute, idAttribute, typeAttribute]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
