//
//  MobioNotificationServiceExtension.swift
//  MobioSDKSwift
//
//  Created by sun on 24/07/2022.
//

import Foundation
import UserNotifications

protocol MobioNotificationServiceExtensionType {
    func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void)
}

public class MobioNotificationServiceExtension: MobioNotificationServiceExtensionType {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        
        self.contentHandler = contentHandler
        bestAttemptContent = request.content.mutableCopy() as? UNMutableNotificationContent
        
        let userInfo = request.content.userInfo
        
        let mediaUrlKey = "ct_mediaUrl"
        let mediaTypeKey = "ct_mediaType"
        
        let mediaUrl = userInfo[mediaUrlKey] as? String
        let mediaType = userInfo[mediaTypeKey] as? String
        
        loadAttachment(forUrlString: mediaUrl, withType: mediaType) { [self] attachment in
            if let attachment = attachment {
                bestAttemptContent?.attachments = [attachment]
            }
            self.contentHandler?(bestAttemptContent!)
        }
    }
    
    func loadAttachment(forUrlString urlString: String?, withType mediaType: String?, completionHandler: @escaping (UNNotificationAttachment?) -> Void) {
        
        var attachment: UNNotificationAttachment? = nil
        let attachmentURL = URL(string: urlString ?? "")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let attachmentURL = attachmentURL {
            session.downloadTask(with: attachmentURL) { [self] temporaryFileLocation, response, error in
                if let error = error {
                } else {
                    let fileExt = fileExtension(forMediaType: mediaType, mimeType: response?.mimeType)
                    let fileManager = FileManager.default
                    let localURL = URL(fileURLWithPath: (temporaryFileLocation?.path ?? "") + fileExt)
                    do {
                        if let temporaryFileLocation = temporaryFileLocation {
                            try fileManager.moveItem(at: temporaryFileLocation, to: localURL)
                        }
                    } catch {
                    }
                    attachment = try? UNNotificationAttachment(identifier: "", url: localURL, options: nil)
                }
                completionHandler(attachment)
            }.resume()
        }
    }
    
    func fileExtension(forMediaType mediaType: String?, mimeType: String?) -> String {
        var ext: String?
        if mediaType == "image" {
            ext = "jpg"
        } else if mediaType == "video" {
            ext = "mp4"
        } else if mediaType == "audio" {
            ext = "mp3"
        } else {
            // If mediaType is none, check for mimeType of url.
            if mimeType == "image/jpeg" {
                ext = "jpeg"
            } else if mimeType == "image/png" {
                ext = "png"
            } else if mimeType == "image/gif" {
                ext = "gif"
            } else {
                ext = ""
            }
        }
        return "." + (ext ?? "")
    }
}
