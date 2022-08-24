//
//  TrackingManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 25/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol Trackable {
    func track(name: String, properties: MobioSDK.Dictionary)
}

@available(iOSApplicationExtension, unavailable)
protocol Identifyable {
    func identify(name: String, properties: MobioSDK.Dictionary)
}

@available(iOSApplicationExtension, unavailable)
class TrackingManager {
    
    let trackRepository = TrackingRepository(api: HTTPClient.shared)
}

@available(iOSApplicationExtension, unavailable)
extension TrackingManager: Trackable, Identifyable {
    
    func track(name: String, properties: MobioSDK.Dictionary) {
        trackRepository.getTrackingData(event: name, properties: properties)
    }
    
    func identify(name: String, properties: MobioSDK.Dictionary) {
        trackRepository.getTrackingData(event: name, properties: properties)
    }
}

@available(iOSApplicationExtension, unavailable)
extension MobioSDK: Trackable, Identifyable {
    
    /// Track a event with properties.
    ///
    /// In example.
    /// Create a properties type dictionary:[String: Any] then call method track.
    ///
    ///     let properties = ["screenName": "Home"]
    ///     analytics.track(name: "track_button", properties: properties)
    ///
    /// - Parameter name: The event name.
    /// - Parameter properties: The properties contain info.
    public func track(name: String, properties: Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
    
    /// Identify user's infomation.
    ///
    /// In example.
    /// Create a properties type [String: Any] then call method identify.
    ///
    ///     let properties = ["email": "devios@mobio.io",
    ///                       "name": "devios"]
    ///     analytics.identify(name: "sdk_mobile_test_identify_app", properties: properties)
    ///
    /// - Parameter name: The event name.
    /// - Parameter properties: The properties.
    public func identify(name: String, properties: Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
}
