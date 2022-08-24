//
//  WebPopupType.swift
//  MobioSDKSwift
//
//  Created by Sun on 30/05/2022.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
enum WebPopupType {
    case url(popupData: PopupData, actionData: PopupBuilderActionData)
    case html
    
    var height: CGFloat {
        switch self {
        case .url(let popupData, let actionData):
            if let size = actionData.size, CGFloat(size.heightMobile) < Screen.height,
                let position = popupData.popupPosition, position != "cc" {
                return CGFloat(size.heightMobile)
            } else {
                return Screen.height - Screen.statusBarHeight
            }
        case .html:
            return Screen.height - Screen.statusBarHeight
        }
    }
    
    var position: NSLayoutConstraint.Attribute {
        switch self {
        case .url(let popupData, _):
            if let position = popupData.popupPosition,
               let transitionPosition = WebTransitionPosition(rawValue: position) {
                return transitionPosition.getPosition()
            }
        default: return .centerY
        }
        return .centerY
    }
}
