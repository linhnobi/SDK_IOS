//
//  BluetoothManager.swift
//  NetworkInfo
//
//  Created by Sun on 04/05/2022.
//

import CoreBluetooth

protocol BluetoothManagerDelegate: class {
    func sendBluetoothStatus(_ status: Bool)
}

class BluetoothManager: NSObject {
    
    var manager = CBCentralManager()
    weak var bluetoothManagerDelegate: BluetoothManagerDelegate?
    
    override init() {
        super.init()
        manager.delegate = self
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    
    @objc func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            bluetoothManagerDelegate?.sendBluetoothStatus(true)
        } else {
            bluetoothManagerDelegate?.sendBluetoothStatus(false)
        }
    }
}
