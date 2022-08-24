//
//  AppleUtils.swift
//  AppDemo
//
//  Created by LinhNobi on 23/08/2021.
//

import Foundation

import SystemConfiguration
import UIKit

internal class IOSVendorSystem {
    
    static let current = IOSVendorSystem()
        
    
    private let device = UIDevice.current
    
    var manufacturer: String {
        return "Apple"
    }
    
    var type: String {
        #if os(iOS)
        return "ios"
        #else
        return "unknown"
        #endif
    }
    
    var model: String {
        // eg "iPhone5,1"
        return deviceModel()
    }
    
    var name: String {
        // eg. "iPod Touch"
        return device.model
    }
    
    var identifierForVendor: String {
        return device.identifierForVendor?.uuidString ?? ""
    }
    
    var systemName: String {
        return device.systemName
    }
    
    var systemVersion: String {
        return device.systemVersion
    }
    
    var userAgent: String? {
        return "unknown"
    }
    
    var connection: ConnectionStatus {
        return connectionStatus()
    }
    
    private func deviceModel() -> String {
        var name: [Int32] = [CTL_HW, HW_MACHINE]
        var size: Int = 2
        sysctl(&name, 2, nil, &size, nil, 0)
        var hw_machine = [CChar](repeating: 0, count: Int(size))
        sysctl(&name, 2, &hw_machine, &size, nil, 0)
        let model = String(cString: hw_machine)
        return model
    }
    
}

// MARK: - Reachability

extension ConnectionStatus {
    init(reachabilityFlags flags: SCNetworkReachabilityFlags) {
        let connectionRequired = flags.contains(.connectionRequired)
        let isReachable = flags.contains(.reachable)
        #if !os(macOS)
        let isCellular = flags.contains(.isWWAN)
        #endif
        if !connectionRequired && isReachable {
            #if !os(macOS)
            if isCellular {
                self = .online(.cellular)
            } else {
                self = .online(.wifi)
            }
            #else
            self = .online(.wifi)
            #endif
        } else {
            self = .offline
        }
    }
}

internal func connectionStatus() -> ConnectionStatus {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    guard let defaultRouteReachability = (withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }) else {
        return .unknown
    }
    
    var flags : SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
        return .unknown
    }
    
    return ConnectionStatus(reachabilityFlags: flags)
}
