//
//  DeviceRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 31/03/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol DeviceRepositoryType {
    func sendDeviceData()
    func saveDID(_ dID: String)
}

@available(iOSApplicationExtension, unavailable)
final class DeviceRepository: ServiceBaseRepository {
}

@available(iOSApplicationExtension, unavailable)
extension DeviceRepository: DeviceRepositoryType {
    
    func saveDID(_ dID: String) {
        UserDefaultManager.set(value: dID, forKey: .dID)
    }
    
    func sendDeviceData() {
        guard let api = api else { return }
        let input = DeviceRequest()
        api.request(input: input) { (object: DeviceResponse?, error) in
            if error != nil {
                super.createFailApi(input: input)
            }
        }
    }
}
