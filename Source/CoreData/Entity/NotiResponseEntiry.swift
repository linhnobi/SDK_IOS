//
//  NotiResponseEntiry.swift
//  MobioSDKSwift
//
//  Created by sun on 09/08/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
class NotiResponseEntiry: NSEntityDescription {
    
    override init() {
        super.init()
        let className = NSStringFromClass(NotiResponse.self)
        name = className
        managedObjectClassName = className
        let contentAttribute = NSAttributeDescription()
        contentAttribute.name = "content"
        contentAttribute.attributeType = .stringAttributeType
        let dataAttribute = NSAttributeDescription()
        dataAttribute.name = "data"
        dataAttribute.attributeType = .stringAttributeType
        let desScreenAttribute = NSAttributeDescription()
        desScreenAttribute.name = "desScreen"
        desScreenAttribute.attributeType = .stringAttributeType
        let sourceScreenAttribute = NSAttributeDescription()
        sourceScreenAttribute.name = "sourceScreen"
        sourceScreenAttribute.attributeType = .stringAttributeType
        let titleAttribute = NSAttributeDescription()
        titleAttribute.name = "title"
        titleAttribute.attributeType = .stringAttributeType
        let typeAttribute = NSAttributeDescription()
        typeAttribute.name = "type"
        typeAttribute.attributeType = .integer32AttributeType
        properties = [contentAttribute, dataAttribute, desScreenAttribute, sourceScreenAttribute, titleAttribute, typeAttribute]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
