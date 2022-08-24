//
//  BaseNotificationContentViewController.swift
//  MobioSDKSwift
//
//  Created by Sun on 15/08/2022.
//

import UIKit
import UserNotificationsUI

protocol NotificationContentViewControllerType: XibSceneBased {
    
    var data: NotificationContentDataType! { get set }
    func handleAction(response: UNNotificationResponse) -> UNNotificationContentExtensionResponseOption
    func configureUserNotificationsCenter()
}
