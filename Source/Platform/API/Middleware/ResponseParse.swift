//
//  ResponseParse.swift
//  MobioSDKSwift
//
//  Created by Sun on 22/03/2022.
//

import Foundation

struct ResponseParse {
    
    static func parseJson(from data: Data?) -> [String: Any] {
        guard let data = data else {
            return [String: Any]()
        }
        if let dictionaryResponse = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            return dictionaryResponse
        } else {
            return [String: Any]()
        }
    }
}
