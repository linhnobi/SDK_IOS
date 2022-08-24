//
//  XibSceneBased.swift
//  MobioSDKSwift
//
//  Created by Sun on 06/01/2022.
//

import UIKit

@objc public protocol XibSceneBased where Self: UIViewController {
}

extension XibSceneBased {
    
    public static func instantiate() -> Self {
        let bundle = Bundle(for: Self.self)
        let nibName = String(describing: Self.self)
        let viewController = Self(nibName: nibName, bundle: bundle)
        return viewController
    }
}
