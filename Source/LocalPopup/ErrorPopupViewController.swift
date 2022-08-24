//
//  ErrorPopupViewController.swift
//  MobioBank
//
//  Created by Sun on 18/10/2021.
//

import UIKit

final class ErrorPopupViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var backgroundView: UIView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.backgroundView.alpha = 0.6
        }
    }
    
    // MARK: - View
    private func setupView() {
        let backGroundGesture = UITapGestureRecognizer(target: self, action: #selector(closeAction))
        backgroundView.addGestureRecognizer(backGroundGesture)
    }
    
    // MARK: - Action
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
