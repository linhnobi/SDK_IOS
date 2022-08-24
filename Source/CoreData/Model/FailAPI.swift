//
//  FailAPI.swift
//  MobioSDKSwift
//
//  Created by Sun on 16/02/2022.
//

import Foundation
import CoreData

@available(iOSApplicationExtension, unavailable)
@objc(FailAPI)
class FailAPI: NSManagedObject {
    
    @NSManaged public var urlString: String
    @NSManaged public var event: String
    @NSManaged public var params: [String: Any]
    @NSManaged public var type: String
    
    convenience init(urlString: String, event: String, params: [String: Any], type: String) {
        self.init(context: DBManager.shared.viewContext)
        self.urlString = urlString
        self.event = event
        self.params = params
        self.type = type
    }
}
