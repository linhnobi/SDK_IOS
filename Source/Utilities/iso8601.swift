//
//  iso8601.swift
//  AppDemo
//
//  Created by LinhNobi on 27/09/2021.
//

import Foundation

var __mobio_iosDateFormatter = MobioISO8601DateFormatter()

class MobioISO8601DateFormatter: DateFormatter {
    override init() {
        super.init()

        self.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        self.locale = Locale(identifier: "en_US_POSIX")
        self.timeZone = TimeZone(secondsFromGMT: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension Date {
    func iso8601() -> String {
        return __mobio_iosDateFormatter.string(from: self)
    }
}

internal extension String {
    func iso8601() -> Date? {
        return __mobio_iosDateFormatter.date(from: self)
    }
}
