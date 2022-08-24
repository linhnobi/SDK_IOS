//
//  WebTransitionPosition.swift
//
//  Created by Sun on 20/05/2022.
//

import UIKit

enum WebTransitionPosition: String {
    case top = "tc"
    case bottom = "bc"
    case center = "cc"
    
    func getPosition() -> NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .center:
            return .centerY
        }
    }
}
