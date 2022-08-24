//
//  Navigationable.swift
//  MobioSDKSwift
//
//  Created by Sun on 22/03/2022.
//

import UIKit

protocol Navigationable {
    var topViewController: UIViewController? { get }
    var navigationBarHeight: CGFloat { get }
}

@available(iOSApplicationExtension, unavailable)
extension Navigationable {
    
    var topViewController: UIViewController? {
        return UIApplication.getTopViewController()
    }
    
    var navigationBarHeight: CGFloat {
        let navigationBar = topViewController?.navigationController?.navigationBar
        if navigationBar?.isHidden == true {
            return 0
        }
        if let height = navigationBar?.frame.height {
            return height
        } else {
            return 0
        }
    }
    
    @available(iOSApplicationExtension, unavailable)
    var navigationController: UINavigationController? {
         return UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
}
