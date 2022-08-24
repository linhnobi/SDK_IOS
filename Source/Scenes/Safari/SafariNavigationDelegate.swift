//
//  SafariNavigationDelegate.swift
//  MobioSDKSwift
//
//  Created by Sun on 03/06/2022.
//

import WebKit

protocol SafariNavigationDelegateProtocol {
    func didFinish(with url: String)
}

final class SafariNavigationDelegate: NSObject, WKNavigationDelegate {
    
    var delegate: SafariNavigationDelegateProtocol?
    
    public func webView(_ webView: WKWebView,
                        didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    public func webView(_ webView: WKWebView,
                        didFinish navigation: WKNavigation!) {
        if let urlString = webView.url?.description {
            delegate?.didFinish(with: urlString)
        }
    }
}
