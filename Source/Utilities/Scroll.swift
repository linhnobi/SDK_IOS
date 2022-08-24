//
//  File.swift
//
//  Created by LinhNobi on 13/10/2021.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
public class Scroll: NSObject {
    
    static let shared = Scroll()
    var screenName = ""
    let trackRepository = TrackingRepository(api: HTTPClient.shared)
    public func trackScrollView(_ scrollView: UIScrollView, screenName: String) {
        scrollView.delegate = self
        self.screenName = screenName
    }
}

@available(iOSApplicationExtension, unavailable)
extension Scroll: UIScrollViewDelegate {
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let height = scrollView.contentSize.height
        let viewed = scrollView.contentOffset.y + scrollView.bounds.size.height
        let pagePercentScrolled = viewed / height * 100
    
        let properties: MobioSDK.Dictionary = [
            "screen_name": screenName,
            "percentage_scroll": Int(pagePercentScrolled),
            "direction": "vertical",
            "unit": "percent"
        ]
        trackRepository.getTrackingData(event: "Scroll Event", properties: properties, type: .scroll)
    }
}
