//
//  NotificationRepository.swift
//  MobioSDKSwift
//
//  Created by sun on 21/04/2022.
//

import Foundation

protocol NotificationRepositoryType {
    func sendNotificationData(permission: String, token: String?)
}

@available(iOSApplicationExtension, unavailable)
final class NotificationRepository: ServiceBaseRepository {
}

@available(iOSApplicationExtension, unavailable)
extension NotificationRepository: NotificationRepositoryType {
    
    func sendNotificationData(permission: String, token: String?) {
        guard let api = api else { return }
        let input = NotificationRequest(permission: permission, token: token)
        api.request(input: input) { (object: NotificationResponse?, error) in
            if error != nil {
                super.createFailApi(input: input)
            }
        }
    }
}
