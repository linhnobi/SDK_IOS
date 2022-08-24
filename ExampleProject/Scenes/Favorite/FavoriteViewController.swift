//
//  FavoriteViewController.swift
//  ExampleProject
//
//  Created by Sun on 21/12/2021.
//

import UIKit
import MobioSDKSwift

class FavoriteViewController: UIViewController {

    // MARK: - Property
    var analytics = MobioSDK.shared

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors([])
    }
}
