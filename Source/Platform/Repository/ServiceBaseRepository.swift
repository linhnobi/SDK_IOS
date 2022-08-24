//
//  ServiceBaseRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 24/02/2022.
//

import Foundation

protocol ServiceBaseRepositoryType {
    func createFailApi(input: ServiceBaseRequest)
}

@available(iOSApplicationExtension, unavailable)
class ServiceBaseRepository {
    
    var api: HTTPClient!
    
    init(api: HTTPClient) {
        self.api = api
    }
}

@available(iOSApplicationExtension, unavailable)
extension ServiceBaseRepository: ServiceBaseRepositoryType {
    
    func createFailApi(input: ServiceBaseRequest) {
        let failApi = FailAPI(urlString: input.urlString, event: input.event, params: input.params, type: input.type)
    }
}
