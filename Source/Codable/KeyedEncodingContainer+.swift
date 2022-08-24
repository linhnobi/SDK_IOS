//
//  KeyedEncodingContainer+.swift
//  MobioSDKSwift
//
//  Created by Sun on 31/03/2022.
//

import Foundation

extension KeyedEncodingContainer {
    
    public mutating func encode(_ value: [String: Any], forKey key: KeyedEncodingContainer<K>.Key) throws {
        var container = nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        try container.encode(value)
    }
    
    public mutating func encode(_ value: [Any], forKey key: KeyedEncodingContainer<K>.Key) throws {
        var container = nestedUnkeyedContainer(forKey: key)
        try container.encode(value)
    }
    
    public mutating func encodeIfPresent(_ value: [String: Any]?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            var container = nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
            try container.encode(value)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Any]?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            var container = nestedUnkeyedContainer(forKey: key)
            try container.encode(value)
        }
    }
}

extension KeyedEncodingContainer where K == JSONCodingKeys {
    mutating func encode(_ value: [String: Any]) throws {
        for (k, v) in value {
            let key = JSONCodingKeys(stringValue: k)!
            switch v {
            case is NSNull:
                try encodeNil(forKey: key)
            case let string as String:
                try encode(string, forKey: key)
            case let int as Int:
                try encode(int, forKey: key)
            case let bool as Bool:
                try encode(bool, forKey: key)
            case let double as Double:
                try encode(double, forKey: key)
            case let dict as [String: Any]:
                try encode(dict, forKey: key)
            case let array as [Any]:
                try encode(array, forKey: key)
            default:
                continue
            }
        }
    }
}
