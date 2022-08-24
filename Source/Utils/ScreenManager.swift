//
//  ScreenManager.swift
//  RemoteNotification
//
//  Created by Sun on 03/11/2021.
//

import UIKit

struct ScreenManager {
    
    static func getScreenArray(with arrayName: [String]) -> [UIViewController] {
        let screenArray = arrayName.map { screenName -> UIViewController in
            getScreen(with: screenName)
        }
        return screenArray
    }
    
    static func getScreenType(with name: String) -> UIViewController.Type {
        guard let moduleName = Bundle.main.infoDictionary?["CFBundleName"] as? String else { return UIViewController.self }
        if let screen = NSClassFromString(moduleName + "." + name) as? UIViewController.Type {
            return screen
        } else {
            return UIViewController.self
        }
    }
    
    static func getScreen(with screenName: String) -> UIViewController {
        let screenType = getScreenType(with: screenName)
        let screen = screenType.init()
        return screen
    }
}
