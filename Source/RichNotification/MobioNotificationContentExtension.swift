//
//  MobioNotificationContentExtension.swift
//  MobioRichNotification
//
//  Created by Sun on 04/08/2022.
//

import UIKit
import UserNotificationsUI

@available(iOSApplicationExtension, unavailable)
open class MobioNotificationContentExtension: UIViewController, UNNotificationContentExtension {
    
    var viewController: NotificationContentViewControllerType!
    
    open func didReceive(_ notification: UNNotification) {
        guard let richNotificationContent = JSONManager.decode(RemoteNotificationData.self, from: notification.request.content.userInfo) else {
            return
        }
        let aps = richNotificationContent.aps
        let data = aps.richNotificationContentData
        if let bigPictureData = data?.bigPicture {
            viewController = BigPictureViewController.instantiate()
            viewController.data = bigPictureData
        }
        if let countDownData = data?.countDown {
            viewController = CountDownViewController.instantiate()
            viewController.data = countDownData
        }
        if let sliderData = data?.slider {
            viewController = SlideViewController.instantiate()
            viewController.data = sliderData
        }
        if let inputData = data?.input {
            viewController = InputViewController.instantiate()
            viewController.data = inputData
        }
        if let ratingData = data?.rating {
            viewController = RatingViewController.instantiate()
            viewController.data = ratingData
        }
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        didMove(toParent: self)
    }
    
    public func didReceive(_ response: UNNotificationResponse,
                           completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        completion(viewController.handleAction(response: response))
    }
}
