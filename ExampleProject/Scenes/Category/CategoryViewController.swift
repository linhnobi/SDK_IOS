//
//  CategoryViewController.swift
//  ExampleProject
//
//  Created by Sun on 21/12/2021.
//

import UIKit
import MobioSDKSwift

final class CategoryViewController: UIViewController {
    
    // MARK: - Property
    var analytics = MobioSDK.shared

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        addBehaviors([])
    }
    
    @IBAction func toCategory(_ sender: Any) {
        let favorite = FavoriteViewController()
        navigationController?.pushViewController(favorite, animated: true)
    }
}

extension CategoryViewController: XibSceneBased { }
