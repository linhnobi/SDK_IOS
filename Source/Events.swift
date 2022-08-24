//
//  Events.swift
//  AppDemo
//
//  Created by LinhNobi on 26/08/2021.
//

import Foundation
import UIKit

@available(iOSApplicationExtension, unavailable)
extension MobioSDK {
    
    public func screen<P: Codable>(screenTitle: String, category: String? = nil, properties: P?) {
    }
    
    /// Track scroll view.
    ///
    /// ```
    /// analytics.scroll(scrollView, screenName: "AccountViewController")
    /// ```
    ///
    /// - Parameter scrollView: The scroll view you want track.
    /// - Parameter screenName: screen name.
    public func scroll(_ scrollView: UIScrollView, screenName: String) {
        Scroll.shared.trackScrollView(scrollView, screenName: screenName)
    }
}
