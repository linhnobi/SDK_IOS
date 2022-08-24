//
//  Screen.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/04/2022.
//

import Foundation
import UIKit

@available(iOSApplicationExtension, unavailable)
struct Screen: Codable {
    static let bounds = UIScreen.main.bounds
    static var width = bounds.size.width
    static var height = bounds.size.height
    static let statusBarHeight = UIApplication.shared.statusBarFrame.height
}
