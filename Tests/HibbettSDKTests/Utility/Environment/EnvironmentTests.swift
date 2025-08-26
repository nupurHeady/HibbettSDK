//
//  EnvironmentTests.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 7/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

import XCTest
@testable import HibbettSDK

// swiftlint:disable line_length
final class EnvironmentTests: XCTestCase {

    func testEnvironmentValue_canBeCreatedFromString() {
        XCTAssertEqual(Environment.production, Environment(rawValue: "Production"))
        XCTAssertEqual(Environment.dev, Environment(rawValue: "Dev"))
        XCTAssertEqual(Environment.staging, Environment(rawValue: "Staging"))
        XCTAssertEqual(Environment.feature, Environment(rawValue: "Feature"))
    }

    func testEnvironmentURLs_createdProperly() {
        XCTAssertEqual(Environment.production.baseURL().absoluteString, "https://hibbett-mobileapi.prolific.io")
        XCTAssertEqual(Environment.dev.baseURL().absoluteString, "https://heiwcnwj37.execute-api.us-east-1.amazonaws.com/hibbett-dev")
        XCTAssertEqual(Environment.staging.baseURL().absoluteString, "https://it3.hibbettdev.prolific.io")
        XCTAssertEqual(Environment.feature.baseURL().absoluteString, "https://ab9umr3ua9.execute-api.us-east-1.amazonaws.com/hibbett-load-test")
    }
    
}
