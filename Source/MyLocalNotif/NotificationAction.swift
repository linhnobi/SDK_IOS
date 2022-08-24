//
//  NotificationAction.swift
//  MobioSDKSwift
//
//  Created by Sun on 26/01/2022.
//

import NotificationCenter

@available(iOSApplicationExtension, unavailable)
class NotificationAction {
    
    // MARK: - Define
    struct Constant {
        static let openActionIdentifier = "open"
        static let dismissActionIdentifier = UNNotificationDismissActionIdentifier
        static let categoryIdentifier = "actionIdentifier"
    }
    
    // MARK: - Property
    let center: UNUserNotificationCenter
    var popupManager = PopupManager.shared
    let pushRepository = PushRepository(manager: DBManager.shared)
    let trackingManager = TrackingManager()
    
    // MARK: - Init
    init(center: UNUserNotificationCenter) {
        self.center = center
    }
    
    // MARK: - Data
    func setupNotificationAction() {
        let openAction = UNNotificationAction(identifier: Constant.openActionIdentifier, title: "Open", options: [.foreground])
        let dismissAction = UNNotificationAction(identifier: UNNotificationDismissActionIdentifier, title: "Dismiss", options: [.destructive])
        let actionCategory = UNNotificationCategory(identifier: Constant.categoryIdentifier, actions: [openAction, dismissAction], intentIdentifiers: [], options: .customDismissAction)
        center.setNotificationCategories([actionCategory])
    }
    
    // MARK: - Action
    func handleNotificationAction(with response: UNNotificationResponse) {
        let actionIdentifier = response.actionIdentifier
        switch actionIdentifier {
        case Constant.openActionIdentifier:
            setupOpenAction(response: response)
        case UNNotificationDefaultActionIdentifier:
            setupOpenAction(response: response)
        case UNNotificationDismissActionIdentifier:
            setupCancelAction(response: response)
        default:
            break
        }
    }
    
    private func setupOpenAction(response: UNNotificationResponse) {
        let notification = response.notification
        let request = notification.request
        let content = request.content
        let userInfo = content.userInfo
        showPopup(userInfo: userInfo)
    }
    
    private func setupCancelAction(response: UNNotificationResponse) {
        // MARK: - Todo: cancel action
    }
    
    private func showPopup(userInfo: [AnyHashable : Any]) {
        if let pushID = userInfo[NotificationContentUserInfo.pushData.rawValue] as? String {
            let listPush = pushRepository.getList(by: "nodeID == '\(pushID)'")
            guard let push = listPush.first else { return }
            popupManager.push = push
            popupManager.showAccepPopup()
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension NotificationAction: Trackable {
    func track(name: String, properties: MobioSDK.Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
}
