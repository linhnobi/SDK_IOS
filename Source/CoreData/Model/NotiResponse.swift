//
//  NotiResponse.swift
//  MobioSDKSwift
//
//  Created by Sun on 11/01/2022.
//

import CoreData

@available(iOSApplicationExtension, unavailable)
@objc(NotiResponse)
public class NotiResponse: NSManagedObject {
    @NSManaged public var type: Int32
    @NSManaged public var sourceScreen, desScreen, title, content: String
    @NSManaged public var data: String

    public required convenience init(from decoder: Decoder) throws {
        self.init(context: DBManager.shared.viewContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(Int32.self, forKey: .type)
        sourceScreen = try values.decode(String.self, forKey: .sourceScreen)
        desScreen = try values.decode(String.self, forKey: .desScreen)
        title = try values.decode(String.self, forKey: .title)
        content = try values.decode(String.self, forKey: .content)
        data = try values.decode(String.self, forKey: .data)
    }
}

@available(iOSApplicationExtension, unavailable)
extension NotiResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case type
        case sourceScreen = "source_screen"
        case desScreen = "des_screen"
        case title, content, data
    }
}

@available(iOSApplicationExtension, unavailable)
extension NotiResponse: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(sourceScreen, forKey: .sourceScreen)
        try container.encode(desScreen, forKey: .desScreen)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(data, forKey: .data)
    }
}
