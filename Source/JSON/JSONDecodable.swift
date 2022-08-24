//
//  JSONDecodable.swift
//  MobioSDKSwift
//
//  Created by Sun on 08/04/2022.
//

import Foundation

extension JSON: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Int.self) {
            self = .int(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        if let value = try? container.decode([JSON].self) {
            self = .array(value)
            return
        }
        if let value = try? container.decode([String: JSON].self) {
            self = .object(value)
            return
        }
        if let container = try? decoder.singleValueContainer(), container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Cannot decode JSON")
        )
    }
}
