//
//  AppInfo.swift
//  MobioSDKSwift
//
//  Created by Sun on 18/04/2022.
//

import Foundation

struct AppInfo {
    
    static let shared = AppInfo()
    var info = Bundle.main.infoDictionary
    var name = ""
    
    init() {
        name = info?["CFBundleDisplayName"] as? String ?? ""
    }
}
