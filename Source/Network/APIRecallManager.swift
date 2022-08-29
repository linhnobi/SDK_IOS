//
//  APIRecallManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 16/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
public struct APIRecallManager {
    
    public static let shared = APIRecallManager()
    var internetManager = InternetManager()
    let failApiRepository = FailAPIRepository(manager: DBManager.shared)
    let recallAPIRepository = RecallApiRepository(api: HTTPClient.shared)
    let apiRecallQueue = DispatchQueue(label: "ApiRecallQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)
    let group = DispatchGroup()
    
    private init() { }
    
    public func fetchFailApi() {
        apiRecallQueue.async(flags: .barrier) {
            semaphore.wait()
            let failAPIList = getFailAPIList()
            recallFailApiList(failAPIList) {
                semaphore.signal()
            }
        }
    }
    
    private func getFailAPIList() -> [FailAPI] {
        let failApiList = failApiRepository
            .getList()
            .compactMap { failApi -> FailAPI? in
                if var data = failApi.params[failApi.type] as? MobioSDK.Dictionary {
                    data["action_time"] = Date().millisecondsSince1970
                    let copyFailApi = failApi
                    copyFailApi.params = [failApi.type: data]
                    return copyFailApi
                } else {
                    return nil
                }
            }
        return failApiList
    }
    
    private func recallFailApiList(_ failApiList: [FailAPI], complete: @escaping () -> Void) {
        failApiList.forEach { failApi in
            group.enter()
            recallAPIRepository.recall(failAPI: failApi) { recallApiResult in
                defer {
                    group.leave()
                }
                if recallApiResult == .success {
                    failApiRepository.delete(object: failApi)
                }
            }
        }
        group.notify(queue: .main) {
            complete()
        }
    }
    
    mutating func setupInternetManager() {
        internetManager.delegate = self
        internetManager.startObserverInternet()
    }
}

@available(iOSApplicationExtension, unavailable)
extension APIRecallManager: InternetManagerDelegate {
    
    func haveInternet() {
        fetchFailApi()
    }
    
    func dontHaveInternet() {
        // MARK: - TODO: do something
    }
}
