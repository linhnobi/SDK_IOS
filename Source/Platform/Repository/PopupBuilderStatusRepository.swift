//
//  PopupBuilderStatusRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol PopupBuilderStatusRepositoryType {
    func sendPopupBuilderStatus(popupData: PopupData, statusCase: WebStatusCase)
}

@available(iOSApplicationExtension, unavailable)
final class PopupBuilderStatusRepository: ServiceBaseRepository {
    
}

@available(iOSApplicationExtension, unavailable)
extension PopupBuilderStatusRepository: PopupBuilderStatusRepositoryType {
    
    func sendPopupBuilderStatus(popupData: PopupData, statusCase: WebStatusCase) {
        guard let api = api else { return }
        let input = PopupBuilderStatusRequest(popupData: popupData, statusCase: statusCase)
        api.request(input: input) { (object: PopupBuilderResponse?, error) in
            if error != nil {
                super.createFailApi(input: input)
            }
        }
    }
}
