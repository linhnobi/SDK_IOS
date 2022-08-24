//
//  WebPopupFormManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 29/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
struct WebPopupFormManager {
    
    static let popupBuilderFormRepository = PopupBuilderFormRepository(api: HTTPClient.shared)
    
    static func pushDataForm(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase) {
        popupBuilderFormRepository.sendFormData(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase)
    }
}
