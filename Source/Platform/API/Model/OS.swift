//
//  OS.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import UIKit

struct OS: Codable {
    
    var name = UIDevice.current.systemName
    var version = UIDevice.current.systemVersion
}
