//
//  UITests_Performance.swift
//  UITests_Performance
//
//  Created by Sun on 02/08/2022.
//

import XCTest

class UITests_Performance: XCTestCase {
    
    let app = XCUIApplication()
    
    func testTrack() throws {
        measure {
            app.launch()
            app.staticTexts["Track Action"].tap()
        }
    }
    
    func testConfig() throws {
        measure {
            app.launch()
            app.staticTexts["Config Action"].tap()
        }
    }
    
    func testScreenSetting() throws {
        measure {
            app.launch()
            app.staticTexts["Screen Setting"].tap()
        }
    }
    
    func testDeviceToken() throws {
        measure {
            app.launch()
            app.staticTexts["Device Token"].tap()
        }
    }
    
    func testScroll() throws {
        measure {
            app.launch()
            app.staticTexts["To scroll view"].tap()
            let element2 = app.scrollViews.children(matching: .other).element(boundBy: 0)
            let element = element2.children(matching: .other).element(boundBy: 1)
            element.swipeUp()
            element.swipeDown()
            element2.children(matching: .other).element(boundBy: 2).swipeDown()
            element.swipeDown()
            element.swipeUp()
        }
    }
    
    func testDeepLink() throws {
        measure {            
            app.launch()
            app.buttons["Deep link"].tap()
        }
    }
}
