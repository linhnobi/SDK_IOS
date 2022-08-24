//
//  PopupBuilderEventData.swift
//  MobioSDKSwift
//
//  Created by Sun on 27/04/2022.
//

import Foundation

struct PopupBuilderEventData: Codable {
    let key, name: String
    let fields: [PopupBuilderField]
}
