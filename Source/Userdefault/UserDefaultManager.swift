//
//  UserDefaultManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 22/02/2022.
//

import Foundation

public struct UserDefaultManager {
    
    // MARK: - Define
    public enum Keys: String {
        case dID = "m_did"
        case appOpenFirts = "appOpenFirts"
        case versionKey = "MobioVersionKey"
        case buildKey = "MobioBuildKeyV2"
        case screenSetting = "m_screen_setting"
        case token = "m_token"
        case merchantID = "m_merchant_id"
        case screenCurrentView = "m_screen_current_view"
        case screenExitView = "m_screen_exit_view"
    }
    
    // MARK: - Property
    static private let userDefault = UserDefaults.standard
    
    static func set(value: Any, forKey: Keys) {
        userDefault.set(value, forKey: forKey.rawValue)
    }
    
    public static func getString(forKey: Keys) -> String {
        if let value = userDefault.object(forKey: forKey.rawValue) as? String {
            return value
        } else {
            return ""
        }
    }
    
    static func getInt(forKey: Keys) -> Int {
        if let value = userDefault.object(forKey: forKey.rawValue) as? Int {
            return value
        } else {
            return 0
        }
    }
    
    static func getBool(forKey: Keys) -> Bool {
        if let value = userDefault.object(forKey: forKey.rawValue) as? Bool {
            return value
        } else {
            return false
        }
    }
    
    static func getArray(forkey: Keys) -> [Any]? {
        return userDefault.array(forKey: forkey.rawValue)
    }
}
