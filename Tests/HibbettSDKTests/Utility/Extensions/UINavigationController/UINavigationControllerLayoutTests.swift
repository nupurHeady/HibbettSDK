//
//  UINavigationControllerLayoutTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class UINavigationControllerLayoutTests: XCTestCase {

    func testNavigationControllerBarHeight() {
        MainActor.assumeIsolated {
            let navigationController = UINavigationController()
            XCTAssertEqual(navigationController.navigationBarHeight, navigationController.navigationBar.frame.height)
        }
    }

}
