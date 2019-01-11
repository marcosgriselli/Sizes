//
//  Sizes_ExampleUITests.swift
//  Sizes_ExampleUITests
//
//  Created by Marcos Griselli on 06/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class Sizes_ExampleUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDeviceAndOrientationsTap() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["orientation-option"].tap()
        app.buttons["device-option"].tap()
        let elementsQuery = app.scrollViews.otherElements
        
        [app.buttons["portrait"], app.buttons["landscape"]].forEach {
            $0.tap()
            elementsQuery.buttons["iPhone 4s"].tap()
            elementsQuery.buttons["iPhone 5s"].tap()
            elementsQuery.buttons["iPhone 8"].tap()
            elementsQuery.buttons["iPhone 8+"].tap()
            elementsQuery.buttons["iPhone 8+"].tap()
            elementsQuery.buttons["iPhone XS"].tap()
            elementsQuery.buttons["iPhone XS Max"].tap()
            elementsQuery.buttons["iPad 10.5"].tap()
            elementsQuery.buttons["iPad 12.9"].tap()
        }
    }
    
    func testFontSliding() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["contentCategory-option"].tap()
        app.sliders["fontSlider"].adjust(toNormalizedSliderPosition: 1)
        app.sliders["fontSlider"].adjust(toNormalizedSliderPosition: 0)
    }
    
    func testViewPinToTop() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["device-option"].tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["iPhone 5s"].tap()
        let window = app.windows.firstMatch
        XCTAssertNotEqual(window.frame.origin.y, 0)
        app.buttons["pinToTop-option"].tap()
        XCTAssertEqual(window.frame.origin.y, 0)
    }
    
    func testScreenshotAlertSheetDismissal() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["device-option"].tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["iPhone 5s"].tap()
        app.buttons["screenshot"].tap()
        //        app.sheets.buttons["Save Image"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testControllerPresentationAndDismissal() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["device-option"].tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["iPhone 5s"].tap()
        app.buttons["present-button"].tap()
        let dismissButton = app.buttons["dismiss-button"]
        dismissButton.tap()
        XCTAssertFalse(dismissButton.exists)
    }
    
    func testConfigurationSwipeToDismiss() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        let appWindow = app.windows.firstMatch
        let configurationWindow = app.windows.allElementsBoundByIndex.last!
        XCTAssertLessThan(configurationWindow.frame.origin.y, appWindow.frame.height)
        configurationWindow.swipeDown()
        XCTAssertEqual(configurationWindow.frame.origin.y, appWindow.frame.height)
    }
}
