//
//  DeviceRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 01/04/2022.
//

import Foundation

class DeviceRequest: ServiceBaseRequest {
    
    @available(iOSApplicationExtension, unavailable)
    required init() {
        let params = DeviceParamParser.createParam()
        super.init(urlString: URLs.deviceUrl, event: "DeviceRegister", params: params, type: "identity")
    }
}
