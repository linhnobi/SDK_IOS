//
//  FailAPIRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 16/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
public class FailAPIRequest: CoreDataBaseRequest {
    
    init() {
        super.init(className: FailAPI.self)
    }
    
    init(format: String) {
        super.init(className: FailAPI.self, format: format, sortDescriptors: nil)
    }
}
