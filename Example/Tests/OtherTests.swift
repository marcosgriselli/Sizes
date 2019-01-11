//
//  OtherTests.swift
//  Sizes_Tests
//
//  Created by Marcos Griselli on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Sizes

class OtherTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testDeviceIdioms() {
        XCTAssert(Device.valuesForIdiom(.pad).allSatisfy { $0.interfaceIdiom == .pad })
        XCTAssert(Device.valuesForIdiom(.phone).allSatisfy { $0.interfaceIdiom == .phone })
    }
}
