//
//  Date+.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/04/2022.
//

import Foundation

extension Date {
    var millisecondsSince1970: Int {
        Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
