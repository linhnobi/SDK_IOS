//
//  PushRepository.swift
//  MobioSDKSwift
//
//  Created by Cuong on 1/23/22.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol PushRepositoryDelegate: class {
    typealias PushShowHandler = (Push) -> Void
    func pushIsShowed(_ pushID: String)
    func pushIsNotShowed(_ pushID: String)
}


@available(iOSApplicationExtension, unavailable)
final class PushRepository {
    
    typealias T = Push
    
    var manager: DBManagerType!
    weak var delegate: PushRepositoryDelegate?
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
}

@available(iOSApplicationExtension, unavailable)
extension PushRepository: CoreDataBaseRepositoryType {
    
    func getList() -> [T] {
        let pushRequest = PushRequest()
        return getArrayData(input: pushRequest)
    }
    
    func getList(by format: String) -> [T] {
        let pushRequest = PushRequest(format: format)
        return getArrayData(input: pushRequest)
    }
}

@available(iOSApplicationExtension, unavailable)
extension PushRepository: PushRepositoryDelegate {
    
    func setPushShowOrNot(_ pushID: String, pushShowHandler: PushShowHandler) {
        let format = "nodeID == '\(pushID)'";
        let pushArray = getList(by: format)
        for index in 0..<pushArray.count {
            let push = pushArray[index]
            pushShowHandler(push)
        }
    }
    
    func pushIsShowed(_ pushID: String) {
        setPushShowOrNot(pushID) { push in
            push.showed = true
        }
    }
    
    func pushIsNotShowed(_ pushID: String) {
        setPushShowOrNot(pushID) { push in
            push.showed = false
        }
    }
}
