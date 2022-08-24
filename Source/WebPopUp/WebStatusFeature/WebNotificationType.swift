//
//  WebNotificationType.swift
//  MobioSDKSwift
//
//  Created by Sun on 05/05/2022.
//

import Foundation
import UIKit

enum WebNotificationType {
    case normal
    case popup
    
    var data: WebReceiveData {
        switch self {
        case .normal:
            return WebReceiveData(source: WebSource.digienty.rawValue, object: WebStatusObject.notifition.rawValue)
        case .popup:
            return WebReceiveData(source: WebSource.popupBuilder.rawValue, object: WebStatusObject.popup.rawValue)
        }
    }
}
