//
//  NotificationRequest.swift
//  MobioSDKSwift
//
//  Created by sun on 21/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
class NotificationRequest: ServiceBaseRequest {
    
    init(permission: String, token: String?) {
        let params = NotificationParser.createParam(permission: permission, token: token)
        super.init(urlString: URLs.notificationUrl, event: "NotificationEvent", params: params, type: "notification")
    }
}
