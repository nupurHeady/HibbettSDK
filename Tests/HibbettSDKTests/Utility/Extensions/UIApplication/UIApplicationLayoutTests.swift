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

    @MainActor func testUIApplicationStatusBarHeight() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
        XCTAssertEqual(statusBarHeight, UIApplication.statusBarHeight)
    }

}
