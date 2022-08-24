//
//  JSONEncodable.swift
//  MobioSDKSwift
//
//  Created by Sun on 08/04/2022.
//

import Foundation

extension JSON: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .null:
            try container.encodeNil()
        case .array(let value):
            try container.encode(value)
        case .object(let value):
            try container.encode(value)
        case .float(let value):
            try container.encode(value)
        }
    }
}
