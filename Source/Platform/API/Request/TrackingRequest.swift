//
//  TrackingRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/02/2022.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
class TrackingRequest: ServiceBaseRequest {
    
    required convenience init(event: String, properties: MobioSDK.Dictionary, type: String) {
        let params = TrackingParamParser.createParam(event: event, properties: properties, type: type)
        self.init(urlString: URLs.trackUrl, event: event, params: params, type: "track")
    }
}
