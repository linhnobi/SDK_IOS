//
//  PopupBuilderFormRequest.swift
//  MobioSDKSwift
//
//  Created by Sun on 26/04/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
class PopupBuilderFormRequest: ServiceBaseRequest {
    
    required convenience init(popupData: PopupData, actionData: PopupBuilderActionData, submitFormCase: SubmitFormCase) {
        let params = PopupBuilderFormParamParser.createParam(popupData: popupData, actionData: actionData, submitFormCase: submitFormCase)
        self.init(urlString: URLs.trackUrl, event: submitFormCase.data.event, params: params, type: "track")
    }
}
