//
//  CGRect+.swift
//  MobioSDKSwift
//
//  Created by Sun on 08/06/2022.
//

import UIKit

extension CGRect {
    static func > (lhs: CGRect, rhs: CGRect) -> Bool {
        lhs.height > rhs.height
    }
    
    static func < (lhs: CGRect, rhs: CGRect) -> Bool {
        lhs.height < rhs.height
    }
}
