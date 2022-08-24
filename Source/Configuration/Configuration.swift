//
//  Configuration.swift
//  AppDemo
//
//  Created by LinhNobi on 30/09/2021.
//

import Foundation

@objcMembers public class Configuration {
    
    var sdk = SDK()
    
    /// Setup environment: test, app,  uat
    ///
    /// In example.
    ///
    ///     analytics.baseUrlType = .test
    public var baseUrlType = BaseUrlType.app
    var trackable = true
    var delegate: ConfigurationDelegate?

    public init() { }
    
    /// Save merchantID
    ///
    /// In example.
    /// Create a configuration.
    ///
    ///     let config = Configuration()
    ///                  .setMerchantID(value: "9cd9e0ce-12bf-492a-a81b-7aeef078b09f")
    ///
    /// - Parameter value: merchantID string.
    public func setupMerchantID(value: String) -> Configuration {
        UserDefaultManager.set(value: value, forKey: .merchantID)
        return self
    }

    /// Save token
    ///
    /// In example.
    /// Create a configuration.
    ///
    ///     let config = Configuration()
    ///                  .token(value: "9cd9e0ce-12bf-492a-a81b-7aeef078b09f")
    ///
    /// - Parameter value: token string.
    public func setupToken(_ value: String) -> Configuration {
        UserDefaultManager.set(value: value, forKey: .token)
        return self
    }
    
    /// Set code & source for SDK object.
    ///
    /// In example.
    ///
    ///     analytics.setupSDK(code: "m-ios-test-1", source: "MobioBank")
    ///
    /// - Parameter code: code data.
    /// - Parameter source: source data.
    public func setupSDK(code: String, source: String) -> Configuration {
        sdk.code = code
        sdk.source = source
        return self
    }
    
    public func setupEnviroment(baseUrlType: BaseUrlType) -> Configuration {
        self.baseUrlType = baseUrlType
        return self
    }
    
    @discardableResult
    public func setupTrackable(_ value: Bool?) -> Configuration {
        self.trackable = value ?? true
        print("------ debug ------- trackable = ", trackable)
        delegate?.trackableDidSet(value: trackable)
        return self
    }
}
