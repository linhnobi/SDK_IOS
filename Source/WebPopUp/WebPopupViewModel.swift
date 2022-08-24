//
//  WebPopupViewModel.swift
//  MobioSDKSwift
//
//  Created by Sun on 01/04/2022.
//

import WebKit

@available(iOSApplicationExtension, unavailable)
protocol WebPopupViewModelType {
    mutating func showData()
    var remoteNotificationData: RemoteNotificationData { get }
}

@available(iOSApplicationExtension, unavailable)
protocol PopupBuilderDelegate {
    func passDataPopupBuilder(scriptMessageHandler: ScriptMessageHandler, urlRequest: URLRequest)
}

protocol HTMLDelegate {
    func passDataBody(body: String)
}

@available(iOSApplicationExtension, unavailable)
class WebPopupViewModel: NSObject, WebPopupViewModelType {
    
    var navigator: WebPopupNavigator
    var useCase: WebPopupUseCase
    var popupBuilderDelegate: PopupBuilderDelegate?
    var remoteNotificationData: RemoteNotificationData
    var htmlDelegate: HTMLDelegate?
    var webview = WKWebView()
    
    init(remoteNotificationData: RemoteNotificationData, navigator: WebPopupNavigator, useCase: WebPopupUseCase) {
        self.remoteNotificationData = remoteNotificationData
        self.navigator = navigator
        self.useCase = useCase
    }
    
    func showData() {
        switch remoteNotificationData.alert?.contentType {
        case "popup": setupPopupBuilderData()
        case "html": setupHTMLData()
        default: break
        }
        setupWebview()
    }
    
    private func setupWebview() {
        webview.navigationDelegate = self
        webview.uiDelegate = self
        webview.backgroundColor = .clear
        webview.isOpaque = false
    }
    
    func setupPopupBuilderData() {
        let config = createConfig()
        webview = WKWebView(frame: UIScreen.main.bounds, configuration: config)
        let data = remoteNotificationData.data
        guard let popupURL = data?.popupURL,
              let url = URL(string: popupURL) else { return }
        let urlRequest = URLRequest(url: url)
        webview.load(urlRequest)
    }
    
    private func createScript() -> WKUserScript {
        let source = "window.addEventListener('message', function(e){ webkit.messageHandlers.sumbitToiOS.postMessage(event.data); })"
        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        return script
    }
    
    private func createConfig() -> WKWebViewConfiguration {
        let scriptMessageHandler = ScriptMessageHandler()
        scriptMessageHandler.delegate = self
        let contentController = WKUserContentController()
        contentController.add(scriptMessageHandler, name: "sumbitToiOS")
        let script = createScript()
        contentController.addUserScript(script)
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        return config
    }
    
    func setupHTMLData() {
        webview = WKWebView(frame: UIScreen.main.bounds)
        let body = remoteNotificationData.alert?.body ?? ""
        let htmlString = setupHtmlString(body: body)
        webview.loadHTMLString(htmlString, baseURL: nil)
        navigator.presentPopup(webview: webview, webPopupType: .html)
    }
    
    func setupHtmlString(body: String) -> String {
        let header = """
<html> <head> <meta name=\"viewport\" content=\"width\"=\"device-width,\" initial-scale=\"1,\" user-scalable=\"0\"/> <style>html{height: 100%; margin-top: 0;}body{min-height: 100%; position: relative; background: rgba(0, 0, 0, 0.2); height: 100%; overflow: hidden; margin: 0;}#m_modal{width: 100%; margin: 0rem auto; position: relative; text-align: center; border-radius: 10px; background: #fff; height: 100%; overflow: hidden;}#m_modal2{margin-top: 0rem; padding: 0rem 1rem 1.2rem 1rem; height: calc(100% - 4rem); overflow: auto;}#m_modal{max-width: 92%; margin: 0rem auto; max-height: 100%; overflow: hidden;}#m_modal img{width: -webkit-fill-available !important;}</style> </head> <body> <div id=\"m_modal\"> <div style=\"height: 3rem;\"> <div class=\"mo-modal-close-btn\" style=\" width: 1.575rem; height: 1.575rem; display: flex; justify-content: center; align-items: center; position: absolute; top: 0.425rem; right: 0.425rem; background: #5a5a5a; border-radius: 1.25rem; border: 3px solid #fff; \" > <svg enable-background=\"new 0 0 11 11\" viewBox=\"0 0 11 11\" x=\"0\" y=\"0\" class=\"\" style=\"color: #fff; font-size: 0.75rem; width: 0.65rem; height: 0.65rem; cursor: pointer; fill: currentColor;\"> <path d=\"m10.7 9.2-3.8-3.8 3.8-3.7c.4-.4.4-1 0-1.4-.4-.4-1-.4-1.4 0l-3.8 3.7-3.8-3.7c-.4-.4-1-.4-1.4 0-.4.4-.4 1 0 1.4l3.8 3.7-3.8 3.8c-.4.4-.4 1 0 1.4.2.2.5.3.7.3.3 0 .5-.1.7-.3l3.8-3.8 3.8 3.8c.2.2.4.3.7.3s.5-.1.7-.3c.4-.4.4-1 0-1.4z\" ></path> </svg> </div></div><div id=\"m_modal2\">
"""
        let footer = "</div></div></body></html>"
        let htmlString = header + body + footer
        return htmlString
    }
    
    func handleMessage(_ message: String, actionData: PopupBuilderActionData) {
        guard let popupData = remoteNotificationData.data else { return }
        let messageCase = WebPopupMessageCase(rawValue: message)
        switch messageCase {
        case .moCloseButtonclick where actionData.page == 1:
            WebPopupStatusManager.pushDataStatusPopup(popupData: popupData, statusCase: .close)
            navigator.dismiss()
        case .moCloseButtonclick where actionData.page == 2:
            navigator.dismiss()
        case .moButtonClick where actionData.includedReport == 1:
            WebPopupFormManager.pushDataForm(popupData: popupData, actionData: actionData, submitFormCase: .report)
        case .moPopupLoaded:
            WebPopupStatusManager.pushDataStatusPopup(popupData: popupData, statusCase: .open)
            navigator.presentPopup(webview: webview, webPopupType: .url(popupData: popupData, actionData: actionData))
        case .moSubmitButtonClick:
            WebPopupFormManager.pushDataForm(popupData: popupData, actionData: actionData, submitFormCase: .submit)
        default: break
        }
    }
    
    func handleAction(_ action: PopupBuilderAction, actionData: PopupBuilderActionData) {
        let actionCase = WebPopupActionCase(value: action)
        switch actionCase {
        case .close where actionData.hasSecondPage == false:
            navigator.dismiss()
        case .redirect(let redirectURL):
            navigator.redirect(urlString: redirectURL)
        case .download(let downloadUrl):
            useCase.download(from: downloadUrl)
        case .none:
            break
        case .close:
            break
        }
    }
    
    func handleTag(tags: [PopupBuilderTag]?) {
        tags?.forEach { tag in
            let splitArray = tag.tagName.split(separator: ":")
            let screenName = String(splitArray[1])
            getViewControllerName(screenName: screenName)
        }
    }
    
    private func getViewControllerName(screenName: String) {
        let configScreenArray = MobioSDK.shared.getConfigScreen()
       let screenSetting = configScreenArray.first { screenSetting in
           screenSetting.title == screenName
        }
        if let controllerName = screenSetting?.controllerName {
            navigator.goto(screen: controllerName)
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension WebPopupViewModel: ScriptMessageHandlerDelegate {
    
    func pass(actionData: PopupBuilderActionData) {
        let message = actionData.message
        handleMessage(message, actionData: actionData)
        handleTag(tags: actionData.tags)
        if let actions = actionData.actions {
            actions.forEach { action in
                handleAction(action, actionData: actionData)
            }
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension WebPopupViewModel: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView,
                        didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    public func webView(_ webView: WKWebView,
                        didFinish navigation: WKNavigation!) {
        guard let data = remoteNotificationData.data else { return }
        let profileInfo = data.profileInfo
        var description = profileInfo.description
        description = description.replacingOccurrences(of: "[", with: "{")
        description = description.replacingOccurrences(of: "]", with: "}")
        webview.evaluateJavaScript("showPopup('\(data)')") { (any, error) in
        }
    }
}

@available(iOSApplicationExtension, unavailable)
extension WebPopupViewModel: WKUIDelegate {
    
    public func webView(_ webView: WKWebView,
                        createWebViewWith configuration: WKWebViewConfiguration,
                        for navigationAction: WKNavigationAction,
                        windowFeatures: WKWindowFeatures) -> WKWebView? {
        let redirectURL = navigationAction.request.url?.description
        navigator.redirect(urlString: redirectURL)
        return nil
    }
}
