//
//  InputViewController.swift
//  MobioSDKSwift
//
//  Created by Sun on 18/08/2022.
//

import UIKit
import UserNotificationsUI

final class InputViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Property
    var data: NotificationContentDataType!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        configureUserNotificationsCenter()
    }
    
    // MARK: - Data
    private func setupData() {
        guard let inputData = data as? Input else {
            return
        }
        downloadImage(from: inputData.imageURL)
    }
    
    func downloadImage(from URLString: String) {
        guard let url = URL(string: URLString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    private func handleMessage(data: String) {
    }
}

extension InputViewController: NotificationContentViewControllerType {
    
    enum NotificationActionIdentifier: String {
        case replyAction
        case closeAction
    }
    
    func handleAction(response: UNNotificationResponse) -> UNNotificationContentExtensionResponseOption {
        if let inputResponse = response as? UNTextInputNotificationResponse {
            handleMessage(data: inputResponse.userText)
        }
        return .dismiss
    }
    
    func configureUserNotificationsCenter() {
        let backAction = UNTextInputNotificationAction(identifier: NotificationActionIdentifier.replyAction.rawValue, title: "Reply", options: [])
        let nextAction = UNNotificationAction(identifier: NotificationActionIdentifier.closeAction.rawValue, title: "Close", options: [])
        let tutorialCategory = UNNotificationCategory(identifier: "myNotificationCategory",
                                                      actions: [backAction, nextAction],
                                                      intentIdentifiers: [],
                                                      options: [])
        let center = UNUserNotificationCenter.current()
        center.setNotificationCategories([tutorialCategory])
    }
}
