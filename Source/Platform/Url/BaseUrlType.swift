//
//  BaseUrlType.swift
//  MobioSDKSwift
//
//  Created by Sun on 22/06/2022.
//

import Foundation

public enum BaseUrlType {
    case app
    case uat
    case test
    case custom(String)
    
    var urlString: String {
        switch self {
        case .custom(let string):
            return string
        case .app:
            return "https://api.mobio.vn/"
        case .uat:
            return "https://api-uat.mobio.vn/"
        case .test:
            return "https://api-test1.mobio.vn/"
        }
    }
}
