//
//  FailAPIRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 16/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol FailAPIRepositoryType {
    func isFailAPIExist(object: FailAPI) -> Bool
}

@available(iOSApplicationExtension, unavailable)
final class FailAPIRepository {
    
    typealias T = FailAPI
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
}

@available(iOSApplicationExtension, unavailable)
extension FailAPIRepository: CoreDataBaseRepositoryType {
    
    func getList() -> [T] {
        let failAPIRequest = FailAPIRequest()
        return getArrayData(input: failAPIRequest)
    }
    
    func getList(by format: String) -> [T] {
        let failAPIRequest = FailAPIRequest(format: format)
        return getArrayData(input: failAPIRequest)
    }
}

@available(iOSApplicationExtension, unavailable)
extension FailAPIRepository: FailAPIRepositoryType {
    
    func isFailAPIExist(object: T) -> Bool {
        let list = getList()
        return list.contains(object)
    }
}
