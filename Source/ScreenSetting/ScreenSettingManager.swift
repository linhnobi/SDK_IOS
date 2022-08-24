//
//  ScreenSettingManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 26/02/2022.
//

import Foundation

protocol ScreenSettingGetable {
    func getConfigScreen() -> Set<ScreenSetting>
}

protocol ScreenSettingSetable {
    func screenSetting(title: String, controllerName: String, timeVisit: Array<Int>)
}

@available(iOSApplicationExtension, unavailable)
struct ScreenSettingManager {
    
    func addConfigScreen(_ screens: ScreenSetting) {
        var configScreen = getConfigScreen()
        configScreen.insert(ScreenSetting(title: screens.title, controllerName: screens.controllerName, timeVisit: screens.timeVisit))
        let data = configScreen.map { try? JSONEncoder().encode($0) }
        UserDefaultManager.set(value: data, forKey: .screenSetting)
        UserDefaults.standard.synchronize()
    }
}

@available(iOSApplicationExtension, unavailable)
extension ScreenSettingManager: ScreenSettingGetable {
    
    
    func getConfigScreen() -> Set<ScreenSetting> {
        guard let encodedData = UserDefaultManager.getArray(forkey: .screenSetting) as? [Data] else {
            return []
        }
        let screenSettingArray = encodedData.compactMap {
            JSONManager.decode(ScreenSetting.self, from: $0)
        }
        return Set(screenSettingArray)
    }
}

@available(iOSApplicationExtension, unavailable)
extension ScreenSettingManager: ScreenSettingSetable {
    
    func screenSetting(title: String, controllerName: String, timeVisit: Array<Int>) {
        addConfigScreen(ScreenSetting(title: title, controllerName: controllerName, timeVisit: timeVisit))
    }
}

@available(iOSApplicationExtension, unavailable)
extension MobioSDK: ScreenSettingGetable {
    
    func getConfigScreen() -> Set<ScreenSetting> {
        screenSettingManager.getConfigScreen()
    }
}

@available(iOSApplicationExtension, unavailable)
extension MobioSDK: ScreenSettingSetable {
    
    /// Screen data setting
    ///
    /// In example.
    ///
    ///     analytics.screenSetting(title: "Home", controllerName: "HomeViewController", timeVisit: [3])
    ///
    /// - Parameter title: screen name.
    /// - Parameter controllerName: class name.
    /// - Parameter timeVisit: time on screen array.
    public func screenSetting(title: String, controllerName: String, timeVisit: Array<Int>) {
        screenSettingManager.screenSetting(title: title, controllerName: controllerName, timeVisit: timeVisit)
    }
}
