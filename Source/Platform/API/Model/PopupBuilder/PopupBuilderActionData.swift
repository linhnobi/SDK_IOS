//
//  PopupBuilderActionData.swift
//  MobioSDKSwift
//
//  Created by sun on 23/04/2022.
//

import Foundation

// MARK: - Remote
@available(iOSApplicationExtension, unavailable)
struct PopupBuilderActionData: Codable {
    let page: Int?
    let popupId: String?
    let tags: [PopupBuilderTag]?
    let name: String?
    let message: String
    let id: String?
    let events: [PopupBuilderEvent]?
    let actions: [PopupBuilderAction]?
    let includedReport: Int?
    let formData: FormData?
    let buttonId: String?
    let hasSecondPage: Bool?
    var size: Size?
    var button: Button {
        if message == WebPopupMessageCase.moSubmitButtonClick.rawValue {
            return Button(type: SubmitFormType.submit.rawValue, id: buttonId)
        } else {
            return Button(type: SubmitFormType.report.rawValue, id: id)
        }
    }
}
