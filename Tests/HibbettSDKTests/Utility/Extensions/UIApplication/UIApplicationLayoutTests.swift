//
//  UIApplicationLayoutTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class UIApplicationLayoutTests: XCTestCase {

    func testUIApplicationStatusBarHeight() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        XCTAssertEqual(statusBarHeight, UIApplication.statusBarHeight)
    }

}
