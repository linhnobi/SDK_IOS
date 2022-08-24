//
//  MobioSDK.swift
//  AppDemo
//
//  Created by LinhNobi on 25/08/2021.
//

import Foundation
import UserNotifications

@available(iOSApplicationExtension, unavailable)
@objcMembers open class MobioSDK: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let version = "1.0.0"
    }
    public typealias Dictionary = [String : Any]
    
    // MARK: - Property
    @available(iOSApplicationExtension, unavailable)
    public static let shared = MobioSDK()
    var iOSlife = iOSLifecycleMonitor()
    let trackingManager = TrackingManager()
    let screenSettingManager = ScreenSettingManager()
    @available(iOSApplicationExtension, unavailable)
    let mobioRemoteNotification = MobioRemoteNotification()
    var apiRecallManager = APIRecallManager.shared
    let notificationRepository = NotificationRepository(api: HTTPClient.shared)
    let connectionManager = ConnectionManager.shared
    var configuration = Configuration()

    @available(iOSApplicationExtension, unavailable)
    public override init() {
        super.init()
        iOSlife.setupListeners()
        setupRemoteNotification()
        apiRecallManager.setupInternetManager()
    }
    
    /// Setup configuration.
    ///
    /// In example.
    ///
    ///     let config = Configuration()
    ///                 .setMerchantID(value: "9cd9e0ce-12bf-492a-a81b-7aeef078b09f")
    ///                 .setToken("f5e27185-b53d-4aee-a9b7-e0579c24d29d")
    ///     analytics.bindConfiguration(configuration: config)
    ///
    /// - Parameter configuration: configuration object.
    public func bindConfiguration(configuration: Configuration) {
        self.configuration = configuration
        self.configuration.delegate = self
    }
    
    @available(iOSApplicationExtension, unavailable)
    private func setupRemoteNotification() {
        mobioRemoteNotification.registerForPushNotifications()
        let remoteNotificationViewModel = RemoteNotificationViewModel()
        mobioRemoteNotification.bindViewModel(to: remoteNotificationViewModel)
    }
    
    /// Send device token string to Mobio
    ///
    /// In example.
    ///
    ///     analytics.send(deviceToken: token)
    ///
    /// - Parameter deviceToken: The device token string.
    public func send(deviceToken: String) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] (granted, error) in
            guard let self = self else { return }
            if granted {
                self.notificationRepository.sendNotificationData(permission: "granted", token: deviceToken)
            }
        }
    }
    
    /// Listen deep link.
    ///
    /// In example.
    ///```
    /// func application(_ application: UIApplication,
    ///                 open url: URL,
    ///                 options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    ///    analytics.deeplink(with: url.host)
    ///    return false
    ///}
    ///```
    public func deeplink(with viewController: String?) {
        guard let viewController = viewController else { return }
        let navigator = Navigator(screenNameArray: [viewController], type: .goto)
        navigator.navigationAction()
    }
}

@available(iOSApplicationExtension, unavailable)
extension MobioSDK: MobioRemoteNotificationType {
    
    /// Register push notifications
    ///
    /// In example.
    ///
    ///     analytics.registerForPushNotifications()
    public func registerForPushNotifications() {
        mobioRemoteNotification.registerForPushNotifications()
    }
    
    /// Listen notification coming.
    ///
    /// In example.
    ///```
    ///public func userNotificationCenter(_ center: UNUserNotificationCenter,
    ///                                   willPresent notification: UNNotification,
    ///                                   withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    ///    analytics.notificationWillPresent(with: notification, completionHandler: completionHandler)
    ///}
    ///```
    public func notificationWillPresent(with notification: UNNotification, completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        mobioRemoteNotification.notificationWillPresent(with: notification, completionHandler: completionHandler)
    }
    
    /// Listen notification did tap.
    ///
    /// In example.
    ///```
    /// public func userNotificationCenter(_ center: UNUserNotificationCenter,
    ///                                       didReceive response: UNNotificationResponse,
    ///                                       withCompletionHandler completionHandler: @escaping () -> Void) {
    ///        analytics.notificationDidReceive(with: response)
    ///        completionHandler()
    ///}
    ///```
    public func notificationDidReceive(with response: UNNotificationResponse) {
        mobioRemoteNotification.notificationDidReceive(with: response)
    }
}

@available(iOSApplicationExtension, unavailable)
extension MobioSDK: ConfigurationDelegate {
    
    func trackableDidSet(value: Bool) {
        apiRecallManager.fetchFailApi()
    }
}
