//
//  SubmitFormCase.swift
//  MobioSDKSwift
//
//  Created by Sun on 06/05/2022.
//

import Foundation

enum SubmitFormCase {
    
    case submit
    case report
    
    var data: SubmitFormData {
        switch self {
        case .submit:
            return SubmitFormData(event: WebPopupEvent.submit.rawValue, type: SubmitFormType.submit.rawValue, object: SubmitFormObject.object.rawValue)
        case .report:
            return SubmitFormData(event: WebPopupEvent.report.rawValue, type: SubmitFormType.report.rawValue, object: SubmitFormObject.object.rawValue)
        }
    }
}
