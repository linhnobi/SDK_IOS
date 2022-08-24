//
//  NotificationContent.swift
//  ExampleNotification
//
//  Created by Sun on 08/10/2021.
//

public class NotificationContent: Decodable {
    
    var title = ""
    var body = ""
    var pushID: String
    
    public init(title: String, body: String, pushID: String) {
        self.title = title
        self.body = body
        self.pushID = pushID
    }
    
    convenience init() {
        self.init(title: "", body: "", pushID: "")
    }
}
