//
//  FileDownloader.swift
//  MobioSDKSwift
//
//  Created by sun on 24/04/2022.
//

import Foundation

protocol FileDownloadable {
    func download(from urlString: String?)
}

struct FileDownloader {
    
    static let shared = FileDownloader()
}

extension FileDownloader: FileDownloadable {
    
    func download(from urlString: String?) {
        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
              let urlString = urlString,
              let url = URL(string: urlString) else {
                  return
              }
        URLSession.shared.downloadTask(with: url) { location, response, error in
            guard let location = location else {
                return
            }
            do {
                try FileManager.default.moveItem(at: location, to: documents.appendingPathComponent(response?.suggestedFilename ?? url.lastPathComponent))
            } catch {
            }
        }.resume()
    }
}
