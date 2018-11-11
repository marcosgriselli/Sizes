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

    func testDeviceTap() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["device-option"].tap()
        let elementsQuery = app.scrollViews.otherElements
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
    
    func testOrientationTap() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["orientation-option"].tap()
        app.buttons["landscape"].tap()
        app.buttons["portrait"].tap()
    }
    
    func testFontSliding() {
        let app = XCUIApplication()
        app.launchArguments = ["-uitest"]
        app.launch()
        app.buttons["contentCategory-option"].tap()
        app.sliders["fontSlider"].adjust(toNormalizedSliderPosition: 1)
        app.sliders["fontSlider"].adjust(toNormalizedSliderPosition: 0)
    }
}
