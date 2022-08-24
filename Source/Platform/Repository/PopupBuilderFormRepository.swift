//
//  PopupBuilderFormRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 26/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol PopupBuilderFormRepositoryType {
    func sendFormData(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase)
}

@available(iOSApplicationExtension, unavailable)
final class PopupBuilderFormRepository: ServiceBaseRepository {
}

@available(iOSApplicationExtension, unavailable)
extension PopupBuilderFormRepository: PopupBuilderFormRepositoryType {
    
    func sendFormData(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase) {
        guard let api = api else { return }
        let input = PopupBuilderFormRequest(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase)
        api.request(input: input) { (object: PopupBuilderResponse?, error) in
            if error != nil {
                super.createFailApi(input: input)
            }
        }
    }
}
