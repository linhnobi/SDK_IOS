//
//  WebStatusCase.swift
//  MobioSDKSwift
//
//  Created by Sun on 05/05/2022.
//

import Foundation

enum WebStatusCase {
    
    case close
    case open
    case receive(WebNotificationType)
    
    var data: WebStatusData {
        switch self {
        case .close:
            return WebStatusData(event: WebPopupEvent.close.rawValue, type: WebStatusType.close.rawValue, object: WebStatusObject.popup.rawValue, source: WebSource.popupBuilder.rawValue)
        case .open:
            return WebStatusData(event: WebPopupEvent.open.rawValue, type: WebStatusType.open.rawValue, object: WebStatusObject.popup.rawValue, source: WebSource.popupBuilder.rawValue)
        case .receive(let notificationType):
            return WebStatusData(event: WebPopupEvent.receive.rawValue, type: WebStatusType.receive.rawValue, object: notificationType.data.object, source: notificationType.data.source)
        }
    }
}
