//
//  FailAPIEntity.swift
//  MobioSDKSwift
//
//  Created by sun on 09/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class FailAPIEntity: NSEntityDescription {
    
    override init() {
        super.init()
        let className = NSStringFromClass(FailAPI.self)
        name = className
        managedObjectClassName = className
        let urlStringAttribute = NSAttributeDescription()
        urlStringAttribute.name = "urlString"
        urlStringAttribute.attributeType = .stringAttributeType
        let eventAttribute = NSAttributeDescription()
        eventAttribute.name = "event"
        eventAttribute.attributeType = .stringAttributeType
        let paramsAttribute = NSAttributeDescription()
        paramsAttribute.name = "params"
        paramsAttribute.attributeType = .transformableAttributeType
        paramsAttribute.valueTransformerName = "NSSecureUnarchiveFromData"
        let typeAttribute = NSAttributeDescription()
        typeAttribute.name = "type"
        typeAttribute.attributeType = .stringAttributeType
        properties = [urlStringAttribute, eventAttribute, paramsAttribute, typeAttribute]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
