//
//  AcceptPopupViewController.swift
//  MobioBank
//
//  Created by Sun on 18/10/2021.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
protocol AcceptPopupDelegate: class {
    func popupDidOpend()
    func popupDidClose()
}

@available(iOSApplicationExtension, unavailable)
open class AcceptPopupViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var acceptButton: GradientButton!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var cancelButton: GradientButton!
    @IBOutlet private weak var backgroundView: UIView!
    
    // MARK: - Define
    enum HidenButton {
        case none
        case cancel
        case agree
    }
    typealias CancelHandler = () -> Void
    typealias AcceptHandler = () -> Void
    typealias OpenHandler = () -> Void
    typealias CloseHandler = () -> Void
    
    // MARK: - Property
    var buttonTitle = ""
    var notiResponse = NotiResponse()
    var hidenButton = HidenButton.none
    var cancelAction: CancelHandler?
    var desScreenName = ""
    var acceptAction: AcceptHandler?
    let trackingManager = TrackingManager()
    weak var delegate: AcceptPopupDelegate?
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        delegate?.popupDidOpend()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundView.alpha = 0
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.backgroundView.alpha = 0.6
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.popupDidClose()
    }
    
    // MARK: - View
    private func setupView() {
        acceptButton.title = buttonTitle
        contentLabel.text = notiResponse.content
        titleLabel.text = notiResponse.title
        cancelButton.title = "Hủy"
        hideButton()
        let backGroundGesture = UITapGestureRecognizer(target: self, action: #selector(closeAction))
        backgroundView.addGestureRecognizer(backGroundGesture)
    }
    
    private func hideButton() {
        switch hidenButton {
        case .none:
            break
        case .cancel:
            cancelButton.isHidden = true
        case .agree:
            acceptButton.isHidden = true
        }
    }
    
    // MARK: - Action
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.acceptAction?()
        }
    }
    
    @IBAction func acceptAction(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            let navigator: NavigatorType = Navigator(screenNameArray: [self.desScreenName], type: .goto)
            navigator.navigationAction()
            self.acceptAction?()
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension AcceptPopupViewController: XibSceneBased { }

@available(iOSApplicationExtension, unavailable)
extension AcceptPopupViewController: Trackable {
    func track(name: String, properties: MobioSDK.Dictionary) {
        trackingManager.track(name: name, properties: properties)
    }
}
