//
//  App.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import UIKit

struct App: Codable {
    
    var manufacturer = DeviceManager.getManufacturer()
    var name = DeviceManager.getName()
    var model = DeviceManager.getModel()
    var type = DeviceManager.getType()
}
