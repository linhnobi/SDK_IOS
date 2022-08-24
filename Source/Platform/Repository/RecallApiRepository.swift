//
//  RecallApiRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 05/04/2022.
//

import Foundation

enum RecallApiResult {
    case success
    case failse
}

@available(iOSApplicationExtension, unavailable)
protocol RecallApiRepositoryType {
    func recall(failAPI: FailAPI, completion: @escaping (RecallApiResult) -> Void)
}

@available(iOSApplicationExtension, unavailable)
final class RecallApiRepository: ServiceBaseRepository {
}

@available(iOSApplicationExtension, unavailable)
extension RecallApiRepository: RecallApiRepositoryType {
    
    func recall(failAPI: FailAPI, completion: @escaping (RecallApiResult) -> Void) {
        guard let api = api else { return }
        let input = RecallApiRequest(failAPI: failAPI)
        api.request(input: input) { (object: FailAPIServerResponse?, error) in
            if error == nil {
                completion(.success)
            } else {
                completion(.failse)
            }
        }
    }
}
