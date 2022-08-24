//
//  InternetManager.swift
//  CheckInternet
//
//  Created by Sun on 16/02/2022.
//

import Network
import Foundation

protocol InternetManagerDelegate {
    func haveInternet()
    func dontHaveInternet()
}

struct InternetManager {
    
    // MARK: - Property
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    var delegate: InternetManagerDelegate?
    
    func startObserverInternet() {
        monitor.pathUpdateHandler = checkInternet(path:)
        monitor.start(queue: queue)
    }
    
    func checkInternet(path: NWPath) {
        DispatchQueue.main.async {       
            if path.status == .satisfied {
                delegate?.haveInternet()
            } else {
                delegate?.dontHaveInternet()
            }
        }
    }
}
