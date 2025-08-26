//
//  DeepLinkDestinationTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class DeepLinkDestinationTests: XCTestCase {

    func testDeepLinkDestinationsNotEqual() {
        XCTAssertNotEqual(DeepLinkDestination.product("1"), DeepLinkDestination.raffle("1"))
    }

}
