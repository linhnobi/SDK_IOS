//
//  WebPopupNavigator.swift
//  MobioSDKSwift
//
//  Created by Sun on 02/04/2022.
//

import UIKit
import WebKit

@available(iOSApplicationExtension, unavailable)
protocol WebPopupNavigatorType {
    typealias VoidHandler = () -> Void
    func dismiss(handler: VoidHandler?)
    func redirect(urlString: String?)
    func presentPopup(webview: WKWebView, webPopupType: WebPopupType)
}

@available(iOSApplicationExtension, unavailable)
struct WebPopupNavigator: WebPopupNavigatorType {
    
    let webPopupViewController = WebPopupViewController.instantiate()
    
    func dismiss(handler: VoidHandler? = nil) {
        webPopupViewController.view.removeFromSuperview()
        webPopupViewController.dismiss(animated: false, completion: handler)
    }
    
    func redirect(urlString: String?) {
        topViewController?.dismiss(animated: false) {
            let safariScreen = SafariViewController.instantiate()
            safariScreen.modalPresentationStyle = .fullScreen
            safariScreen.urlString = urlString
            topViewController?.present(safariScreen, animated: true, completion: nil)
        }
    }
    
    func presentPopup(webview: WKWebView, webPopupType: WebPopupType) {
        webPopupViewController.view.translatesAutoresizingMaskIntoConstraints = false
        webPopupViewController.webview = webview
        setupLayout(popupHeight: webPopupType.height, constraint: webPopupType.position)
    }
    
    private func setupLayout(popupHeight: CGFloat, constraint: NSLayoutConstraint.Attribute) {
        guard let superView = topViewController?.view else { return }
        guard let popupView = webPopupViewController.view else { return }
        superView.addSubview(popupView)
        popupView.widthAnchor.constraint(equalToConstant: Screen.width).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: popupHeight).isActive = true
        let layoutConstraint = NSLayoutConstraint(item: popupView,
                                                  attribute: constraint,
                                                  relatedBy: .equal,
                                                  toItem: superView.safeAreaLayoutGuide,
                                                  attribute: constraint,
                                                  multiplier: 1.0,
                                                  constant: 0)
        superView.addConstraint(layoutConstraint)
    }
    
    func goto(screen: String) {
        dismiss {
            let navigator = Navigator(screenNameArray: [screen], type: .goto)
            navigator.navigationAction()
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension WebPopupNavigator: Navigationable { }
