//
//  UITabBarControllerLayoutTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

@MainActor final class UITabBarControllerLayoutTests: XCTestCase {

    func testTabBarControllerBarHeight() {
        let tabBarController = UITabBarController()
        XCTAssertEqual(tabBarController.tabBarHeight, tabBarController.tabBar.frame.height)
    }

}
