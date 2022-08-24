//
//  SubmitFormData.swift
//  MobioSDKSwift
//
//  Created by Sun on 06/05/2022.
//

import Foundation

struct SubmitFormData {
    var event: String
    var type: String
    var object: String
    var source = WebSource.popupBuilder.rawValue
}
