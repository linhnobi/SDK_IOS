//
//  FormValue.swift
//  MobioSDKSwift
//
//  Created by Sun on 28/03/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
class FormValue: Value {
    
    var id: String
    var journey: Journey
    var button: Button?
    var tags: [PopupBuilderTag]?
    var inputFields: MobioSDK.Dictionary?
    
    enum CodingKeys: String, CodingKey {
        case button
        case inputFields = "input_fields"
        case journey, tags
        case id
    }
    
    init(journey: Journey, button: Button?, tags: [PopupBuilderTag]?, inputFields: MobioSDK.Dictionary?) {
        self.journey = journey
        self.button = button
        self.tags = tags
        self.inputFields = inputFields
        self.id = journey.popupID
        super.init()
    }
    
    convenience init(journey: Journey) {
        self.init(journey: journey, button: nil, tags: nil, inputFields: nil)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try journey = container.decode(Journey.self, forKey: .journey)
        try button = container.decodeIfPresent(Button.self, forKey: .button)
        try tags = container.decodeIfPresent([PopupBuilderTag].self, forKey: .tags)
        try inputFields = container.decodeIfPresent(MobioSDK.Dictionary.self, forKey: .inputFields)
        try id = container.decode(String.self, forKey: .id)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(journey, forKey: .journey)
        try container.encodeIfPresent(button, forKey: .button)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(inputFields, forKey: .inputFields)
        try container.encode(id, forKey: .id)
    }
}
