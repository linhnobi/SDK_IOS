//
//  BaseResponse.swift
//  MobioSDKSwift
//
//  Created by Sun on 29/04/2022.
//

import Foundation

class BaseResponse: Codable {
    let message: String
    let code: Int
    let data: DataResponse
}
