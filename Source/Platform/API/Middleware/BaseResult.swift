//
//  BaseResult.swift

import Foundation

enum BaseResult<T: Codable> {
    case success(T?)
    case failure(error: BaseError?)
}
