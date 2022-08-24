//
//  RichNotificationContent.swift
//  MobioSDKSwift
//
//  Created by Sun on 17/08/2022.
//

import Foundation

struct RichNotificationContentData: Codable {
    let bigPicture: BigPicture?
    let countDown: CountDown?
    let slider: Slider?
    let input: Input?
    let rating: Rating?
    
    enum CodingKeys: String, CodingKey {
        case bigPicture = "big_picture"
        case countDown = "count_down"
        case slider
        case input
        case rating
    }
}
