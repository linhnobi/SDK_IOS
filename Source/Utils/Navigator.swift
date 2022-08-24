//
//  Navigator.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import UIKit


 protocol NavigatorType {
    func navigationAction()
}

class Navigator {
    
    enum NavigatorType: String {
        case goto
        case goback
        case present
    }
    
    var screenNameArray = [String]()
    var type = NavigatorType.goto

    init(screenNameArray: [String], type: NavigatorType) {
        self.screenNameArray = screenNameArray
        self.type = type
    }
}

@available(iOSApplicationExtension, unavailable)
extension Navigator: NavigatorType {
    
    func navigationAction() {
        switch type {
        case .goto:
            let viewControllers = ScreenManager.getScreenArray(with: screenNameArray)
            gotoAction(viewControllers: viewControllers)
        case .goback:
            guard let firstItem = screenNameArray.first else { return }
            let screenType = ScreenManager.getScreenType(with: firstItem)
            gobackAction(screenType: screenType)
        case .present:
            guard let firstItem = screenNameArray.first else { return }
            let screen = ScreenManager.getScreen(with: firstItem)
            presentScreen(screen)
        }
    }
    
    func gobackAction(screenType: UIViewController.Type) {
        
        for controller in navigationController!.viewControllers as Array {
            if controller.isKind(of: screenType.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func gotoAction(viewControllers: [UIViewController]) {
        viewControllers.forEach { viewController in
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func presentScreen(_ screen: UIViewController) {
        navigationController?.present(screen, animated: true, completion: nil)
    }
}

extension Navigator: Navigationable { }
