//
//  WebPopupUseCase.swift
//  MobioSDKSwift
//
//  Created by Sun on 06/04/2022.
//

import Foundation

protocol WebPopupUseCaseType {
}

struct WebPopupUseCase {
    let fileDownloader = FileDownloader.shared
}

extension WebPopupUseCase: WebPopupUseCaseType {
}

extension WebPopupUseCase: FileDownloadable {
    
    func download(from urlString: String?) {
        fileDownloader.download(from: urlString)
    }
}
