//
//  DeviceManager.swift
//  MobioSDKSwift
//
//  Created by sun on 21/04/2022.
//

import UIKit

struct DeviceManager {
    
    static func getModel() -> String {
        var name: [Int32] = [CTL_HW, HW_MACHINE]
        var size: Int = 2
        sysctl(&name, 2, nil, &size, nil, 0)
        var hw_machine = [CChar](repeating: 0, count: Int(size))
        sysctl(&name, 2, &hw_machine, &size, nil, 0)
        let model = String(cString: hw_machine)
        return model
    }
    
    static func getName() -> String {
        return UIDevice.current.name
    }
    
    static func getType() -> String {
        return UIDevice.current.systemName
    }
    
    static func getManufacturer() -> String {
        return "Apple"
    }
}
