//
//  GoldTime.swift
//  MobioSDKSwift
//
//  Created by Sun on 14/02/2022.
//

import Foundation

struct GoldTime {
    
    let startTime: Time
    let endTime: Time
    
    let calendar = Calendar.current
}

extension GoldTime {
    
    private func compareTime(nowTime: Time) -> Bool {
        return nowTime < endTime && nowTime > startTime
    }
    
    func isGoldTime() -> Bool {
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let nowTime = Time(hour: hour, minute: minute)
        return compareTime(nowTime: nowTime)
    }
}
