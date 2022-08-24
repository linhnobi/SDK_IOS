//
//  PopupViewController.swift
//
//  Created by Sun on 27/05/2022.
//

import UIKit
import WebKit

final class WebPopupViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    
    // MARK: - Property
    var webview = WKWebView()
    let presentTransition = WebPresentTransition()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupStackView()
    }

    // MARK: - Setup View
    private func setupStackView() {
        webview.scrollView.isScrollEnabled = false
        webview.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        stackView.addArrangedSubview(webview)
    }
}

extension WebPopupViewController: UIViewControllerTransitioningDelegate {

    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentTransition
    }
}

extension WebPopupViewController: XibSceneBased { }
