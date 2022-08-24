//
//  WebPopupActionCase.swift
//  MobioSDKSwift
//
//  Created by sun on 24/04/2022.
//

import Foundation

enum WebPopupActionCase {
    
    case close
    case redirect(redirectURL: String?)
    case download(downloadUrl: String?)
    case none
    
    init(value: PopupBuilderAction) {
        switch value.actionKey {
        case "CLOSE": self = .close
        case "REDIRECT": self = .redirect(redirectURL: value.redirectUrl)
        case "DOWNLOAD": self = .download(downloadUrl: value.downloadUrl)
        default: self = .none
        }
    }
}
