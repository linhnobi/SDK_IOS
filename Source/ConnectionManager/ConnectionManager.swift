//
//  ConnectionManager.swift
//  NetworkInfo
//
//  Created by Sun on 05/05/2022.
//

import Foundation

class ConnectionManager {
    
    static let shared = ConnectionManager()
    private let bluetoothManager = BluetoothManager()
    var bluetooth = false
    var wifi = false
    var cellular = false
    
    init() {
        bluetoothManager.bluetoothManagerDelegate = self
    }
}

extension ConnectionManager: BluetoothManagerDelegate {
    func sendBluetoothStatus(_ status: Bool) {
        bluetooth = status
    }
}
