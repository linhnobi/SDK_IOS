//
//  iOSLifecycleMonitorViewModel.swift
//  MobioSDKSwift
//
//  Created by Sun on 12/04/2022.
//

import Foundation
import UserNotifications

@available(iOSApplicationExtension, unavailable)
struct iOSLifecycleMonitorViewModel {
    
    let trackingRepository = TrackingRepository(api: HTTPClient.shared)
    let deviceRepository = DeviceRepository(api: HTTPClient.shared)
    let notificationRepository = NotificationRepository(api: HTTPClient.shared)

    func didFinishLaunching() {
        let previousBuild = UserDefaultManager.getString(forKey: .buildKey)
        let infoDictionary = Bundle.main.infoDictionary
        let currentVersion = infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let currentBuild = infoDictionary?["CFBundleVersion"] as? String ?? ""
        let isUserOpenApp = UserDefaultManager.getBool(forKey: .appOpenFirts)
        
        if (!isUserOpenApp) {
            let properties: MobioSDK.Dictionary = [
                "version": currentVersion,
                "build": currentBuild,
            ]
            trackingRepository.getTrackingData(event: "sdk_mobile_test_open_first_app", properties: properties)
            UserDefaultManager.set(value: true, forKey: .appOpenFirts)
            UserDefaults.standard.synchronize()
        }
        
        if previousBuild != "" {
            let properties = [
                "version": currentVersion,
                "build": currentBuild,
            ]
            trackingRepository.getTrackingData(event: "sdk_mobile_test_installed_app", properties: properties)
        }
        
        if currentBuild != previousBuild {
            let properties = [
                "version": currentVersion,
                "build": currentBuild,
            ]
            trackingRepository.getTrackingData(event: "sdk_mobile_test_open_update_app", properties: properties)
        }
        
        // Application Opened
        let properties = [
            "version": currentVersion,
            "build": currentBuild,
        ]
        trackingRepository.getTrackingData(event: "sdk_mobile_test_open_app", properties: properties)
        UserDefaultManager.set(value: currentVersion, forKey: .versionKey)
        UserDefaultManager.set(value: currentBuild, forKey: .buildKey)
        deviceRepository.sendDeviceData()
    }
}
