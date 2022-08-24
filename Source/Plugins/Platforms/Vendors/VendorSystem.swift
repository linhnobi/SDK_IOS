//
//  VendorSystem.swift
//  AppDemo
//
//  Created by LinhNobi on 23/08/2021.
//

import Foundation

internal enum ConnectionType {
    case cellular // Di Động
    case wifi
    case bluetooth
}

internal enum ConnectionStatus {
    case offline
    case online(ConnectionType)
    case unknown
}
