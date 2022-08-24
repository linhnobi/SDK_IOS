//
//  ScreenSetting.swift
//
//
//  Created by LinhNobi on 04/10/2021.
//

import UIKit

struct ScreenSetting: Codable, Hashable {
    public var title: String
    public var controllerName: String
    public var timeVisit: Array<Int>
}
