//
//  Time.swift
//  MobioSDKSwift
//
//  Created by Sun on 14/02/2022.
//

import Foundation

struct Time {
    
    let hour: Int
    let minute: Int
}

extension Time {
    
    static func < (lsh: Time, rsh: Time) -> Bool {
        if lsh.hour < rsh.hour {
            return true
        }
        if lsh.hour == rsh.hour && lsh.minute <= rsh.minute {
            return true
        }
        return false
    }
    
    static func > (lsh: Time, rsh: Time) -> Bool {
        if lsh.hour > rsh.hour {
            return true
        }
        if lsh.hour == rsh.hour && lsh.minute >= rsh.minute {
            return true
        }
        return false
    }
}
