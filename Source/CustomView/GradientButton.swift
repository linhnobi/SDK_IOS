//
//  GradientButton.swift
//  MobioSDK
//
//  Created by Sun on 14/10/2021.
//

import UIKit

public class GradientButton: UIButton {
    
    // MARK: - Define
    struct Constant {
        static let colorOne = UIColor(named: "ColorOne")
        static let colorTwo = UIColor(named: "ColorTwo")
    }
    
    // MARK: - Property
    var title = ""
    
    // MARK: - Life Cycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    // MARK: - View
    private func setupGradientColor() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [Constant.colorOne?.cgColor, Constant.colorTwo?.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupView() {
        setupGradientColor()
        cornerRadius = 8
        setTitle(title, for: .normal)
    }
}
