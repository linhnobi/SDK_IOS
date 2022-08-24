//
//  BigPictureViewController.swift
//  MobioSDKSwift
//
//  Created by Sun on 17/08/2022.
//

import UIKit
import UserNotificationsUI

final class BigPictureViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    // MARK: - Property
    var data: NotificationContentDataType!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    // MARK: - Data
    private func setupData() {
        guard let bigPictureData = data as? BigPicture else { return }
        titleLabel.text = bigPictureData.title
        bodyLabel.text = bigPictureData.body
        downloadImage(from: bigPictureData.imageURL)
    }
    
    private func downloadImage(from URLString: String) {
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
}

extension BigPictureViewController: NotificationContentViewControllerType {
    
    func handleAction(response: UNNotificationResponse) -> UNNotificationContentExtensionResponseOption {
        .dismiss
    }
    
    func configureUserNotificationsCenter() {
    }
}
