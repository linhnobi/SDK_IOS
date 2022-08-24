//
//  MyLocalNotification.swift
//  ExampleNotification
//
//  Created by Sun on 08/10/2021.
//

import UserNotifications
import UIKit

public protocol MyLocalNotificationType {
    func pushNotif(with content: NotificationContent, after second: TimeInterval)
    func pushNotif(with content: NotificationContent, component: DateComponents)
}

@available(iOSApplicationExtension, unavailable)
public class MyLocalNotification: NSObject {
    
    private var center: UNUserNotificationCenter {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        return center
    }
    lazy var notificationAction = NotificationAction(center: center)
    var popupManager = PopupManager.shared
    let pushRepository = PushRepository(manager: DBManager.shared)
    let trackingManager = TrackingManager()
    
    public override init() {
        super.init()
        setupData()
    }
    
    private func setupData() {
        notificationAction.setupNotificationAction()
    }
    
    private func createContent(_ myContent: NotificationContent) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = myContent.title
        content.body = myContent.body
        content.categoryIdentifier = NotificationAction.Constant.categoryIdentifier
        content.userInfo = [NotificationContentUserInfo.pushData.rawValue: myContent.pushID]
        return content
    }
    
    private func createTrigger(with second: TimeInterval) -> UNNotificationTrigger {
        let date = Date().addingTimeInterval(second)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        return trigger
    }
    
    private func createTrigger(dateComponents: DateComponents) -> UNNotificationTrigger {
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        return trigger
    }
    
    private func createRequest(content: NotificationContent, second: TimeInterval) -> UNNotificationRequest {
        let uuidString = UUID().uuidString
        let content = createContent(content)
        let trigger = createTrigger(with: second)
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        return request
    }
    
    private func createRequest(content: NotificationContent, component: DateComponents) -> UNNotificationRequest {
        let uuidString = UUID().uuidString
        let content = createContent(content)
        let trigger = createTrigger(dateComponents: component)
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        return request
    }
}

@available(iOSApplicationExtension, unavailable)
extension MyLocalNotification: MyLocalNotificationType {

    public func pushNotif(with content: NotificationContent, after second: TimeInterval) {
        let request = createRequest(content: content, second: second)
        center.add(request) { (error) in
        }
    }
    
    public func pushNotif(with content: NotificationContent, component: DateComponents) {
        let request = createRequest(content: content, component: component)
        center.add(request) { (error) in
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension MyLocalNotification: UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let request = notification.request
        let content = request.content
        let state = UIApplication.shared.applicationState
        if state == .background || state == .inactive {
            completionHandler([.badge, .alert, .sound])
        } else if state == .active {
            let userInfo = content.userInfo
            if let pushID = userInfo[NotificationContentUserInfo.pushData.rawValue] as? String {
                pushIsNotShowed(pushID)
            }
            completionHandler([])
        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
        notificationAction.handleNotificationAction(with: response)
        completionHandler()
    }
}

@available(iOSApplicationExtension, unavailable)
extension MyLocalNotification: PushRepositoryDelegate {
    
    func pushIsNotShowed(_ pushID: String) {
        pushRepository.pushIsNotShowed(pushID)
    }
    
    func pushIsShowed(_ pushID: String) {
        pushRepository.pushIsShowed(pushID)
    }
}

@available(iOSApplicationExtension, unavailable)
extension MyLocalNotification: Trackable {
    
    func track(name: String, properties: MobioSDK.Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
}
