//
//  Network.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import UIKit

struct Network: Codable {
    var cellular = checkCellular()
    var bluetooth = ConnectionManager.shared.bluetooth
    var wifi = checkWifi()
    var address = ""
    
    static func checkWifi() -> Bool {
        if let reachability: Reachability = try? Reachability() {
            let networkStatus = reachability.connection
            switch networkStatus {
            case .unavailable, .cellular:
                break
            case .wifi:
                return true
            }
        }
        return false
    }
    
    static func checkCellular() -> Bool {
        if let reachability: Reachability =  try? Reachability() {
            let networkStatus = reachability.connection
            switch networkStatus {
            case .unavailable, .wifi:
                break
            case .cellular:
                return true
            }
        } 
        return false
    }
}
