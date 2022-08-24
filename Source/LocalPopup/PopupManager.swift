//
//  PopupManager.swift
//  MobioSDKSwift
//
//  Created by Sun on 13/01/2022.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
public class PopupManager {
    
    // MARK: - Property
    static var shared = PopupManager()
    var rootViewController: UIViewController? {
        return UIApplication.shared.windows.first?.rootViewController
    }
    var push = Push()
    let pushRepository = PushRepository(manager: DBManager.shared)
    var popupOpendStatus = false
    let screenSettingManager = ScreenSettingManager()
    
    // MARK: - View
    private func createAcceptPopup() -> AcceptPopupViewController {
        let acceptPopup = AcceptPopupViewController.instantiate()
        acceptPopup.notiResponse = push.notiResponse
        acceptPopup.buttonTitle = "Đồng Ý"
        acceptPopup.hidenButton = .none
        acceptPopup.modalPresentationStyle = .overFullScreen
        acceptPopup.desScreenName = findDesScreenName(dataPush: push)
        acceptPopup.delegate = self
        return acceptPopup
    }
    
    // MARK: - Action
    func showAccepPopup() {
        let popup = createAcceptPopup()
        if popupOpendStatus {
            rootViewController?.dismiss(animated: false, completion: nil)
        }
        rootViewController?.present(popup, animated: true) { [weak self] in
            guard let self = self else { return }
            self.pushIsShowed(self.push.nodeID)
        }
    }
    
    // MARK: - Data
    private func findDesScreenName(dataPush: Push) -> String {
        let notiResponse = dataPush.notiResponse
        let screenSettingArray = getConfigScreen()
        let screenSetting = screenSettingArray.first { screenSetting in
            screenSetting.title == notiResponse.desScreen
        }
        return screenSetting?.controllerName ?? ""
    }
}

@available(iOSApplicationExtension, unavailable)
extension PopupManager: PushRepositoryDelegate {
    
    func pushIsNotShowed(_ pushID: String) {
        pushRepository.pushIsNotShowed(pushID)
    }
    
    func pushIsShowed(_ pushID: String) {
        pushRepository.pushIsShowed(pushID)
    }
}

@available(iOSApplicationExtension, unavailable)
extension PopupManager: AcceptPopupDelegate {
    
    func popupDidOpend() {
        popupOpendStatus = true
    }
    
    func popupDidClose() {
        popupOpendStatus = false
    }
}

@available(iOSApplicationExtension, unavailable)
extension PopupManager: ScreenSettingGetable {
    
    func getConfigScreen() -> Set<ScreenSetting> {
        screenSettingManager.getConfigScreen()
    }
}
