//
//  CountDownViewController.swift
//  MobioSDKSwift
//
//  Created by sun on 13/08/2022.
//

import UIKit
import UserNotificationsUI

final class CountDownViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    // MARK: - Property
    var nowTime = Date()
    var dateComponents: DateComponents!
    var data: NotificationContentDataType!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        showTime()
    }
    
    // MARK: - Data
    func setupData() {
        guard let countDownData = data as? CountDown else { return }
        titleLabel.text = countDownData.title
        bodyLabel.text = countDownData.body
        downloadImage(from: countDownData.imageURL)
        countDownLabel.text = String(countDownData.time)
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
    
    private func getTimeInfor(dateComponents: DateComponents) -> String {
        var sumary = ""
        let years = abs(dateComponents.year!)
        if years > 0 {
            if years < 10 {
                sumary += "0\(years)"
            } else {
                sumary += "\(years)"
            }
            sumary += " years "
        }
        let month = abs(dateComponents.month!)
        if month > 0 {
            if month < 10 {
                sumary += "0\(month)"
            } else {
                sumary += "\(month)"
            }
            sumary += " month "
        }
        let weeks = abs(dateComponents.weekOfMonth!)
        if weeks > 0 {
            if weeks < 10 {
                sumary += "0\(weeks)"
            } else {
                sumary += "\(weeks)"
            }
            sumary += " weeks "
        }
        let days = abs(dateComponents.day!)
        if days > 0 {
            if days < 10 {
                sumary += "0\(days)"
            } else {
                sumary += "\(days)"
            }
            sumary += " days "
        }
        let hours = abs(dateComponents.hour!)
        if hours > 0 {
            if hours < 10 {
                sumary += "0\(hours)"
            } else {
                sumary += "\(hours)"
            }
            sumary += " hours "
        }
        let min = abs(dateComponents.minute!)
        if min > 0 {
            if min < 10 {
                sumary += "0\(min)"
            } else {
                sumary += "\(min)"
            }
            sumary += " min "
        }
        let sec = abs(dateComponents.second!)
        if sec > 0 {
            if sec < 10 {
                sumary += "0\(sec)"
            } else {
                sumary += "\(sec)"
            }
            sumary += " sec "
        }
        return sumary
    }
    
    func showTime() {
        guard let countDownData = data as? CountDown else { return }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.nowTime.timeIntervalSince1970 <= countDownData.endDate.timeIntervalSince1970 {
                self.nowTime = Date()
                self.dateComponents = Calendar.current.dateComponents([.weekOfMonth, .day , .hour , .minute , .second, .year, .month], from: self.nowTime, to: countDownData.endDate)
                let sumary = self.getTimeInfor(dateComponents: self.dateComponents)
                self.countDownLabel.text = sumary
            } else {
                self.countDownLabel.text = "0 sec"
                timer.invalidate()
            }
        }
    }
}

extension CountDownViewController: NotificationContentViewControllerType {
    
    func handleAction(response: UNNotificationResponse) -> UNNotificationContentExtensionResponseOption {
        .dismiss
    }
    
    func configureUserNotificationsCenter() {
    }
}
