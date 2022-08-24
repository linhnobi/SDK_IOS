//
//  BindableType.swift
//  MobioSDK
//
//

import UIKit

public protocol BindableType: class {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel(to model: Self.ViewModelType)
}

extension BindableType {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
    }
}
