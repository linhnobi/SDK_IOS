//
//  JSON.swift
//  JSONManager
//
//  Created by Sun on 08/04/2022.
//

import Foundation

enum JSON {
    case float(Float)
    case int(Int)
    case double(Double)
    case string(String)
    case bool(Bool)
    case null
    indirect case array([JSON])
    indirect case object([String: JSON])
}

extension JSON {
    public init(_ value: Any) throws {
        switch value {
        case nil:
            self = .null
        case let url as URL:
            self = .string(url.absoluteString)
        case let string as String:
            self = .string(string)
        case let int as Int:
            self = .int(int)
        case let double as Double:
            self = .double(double)
        case let bool as Bool:
            self = .bool(bool)
        case let array as [Any]:
            self = .array(try array.map(JSON.init))
        case let object as [String: Any]:
            self = .object(try object.mapValues(JSON.init))
        default:
            self = .null
        }
    }
}
