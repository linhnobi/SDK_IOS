//
//  ScreenRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 12/07/2022.
//

import UIKit

struct ScreenRequest: Codable {
    static let bounds = UIScreen.main.bounds
    var width = bounds.size.width
    var height = bounds.size.height
}
