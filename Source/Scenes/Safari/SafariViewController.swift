//
//  SafariViewController.swift
//  MobioSDKSwift
//
//  Created by Sun on 03/06/2022.
//

import UIKit
import WebKit

final class SafariViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var webview: WKWebView!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    
    // MARK: - Property
    var urlString: String? = ""
    let safariNavigationDelegate = SafariNavigationDelegate()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        setupWebview()
        setupCloseButton()
    }
    
    private func setupWebview() {
        webview.navigationDelegate = safariNavigationDelegate
        safariNavigationDelegate.delegate = self
        if let urlString = urlString,
           let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }
    
    private func setupCloseButton() {
        let closeImage = UIImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        closeButton.setImage(closeImage, for: .normal)
        closeButton.setTitle("", for: .normal)
    }
    
    // MARK: - Action
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SafariViewController: SafariNavigationDelegateProtocol {
    
    func didFinish(with url: String) {
        urlLabel.text = url
    }
}

extension SafariViewController: XibSceneBased { }
