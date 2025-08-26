//
//  JSONHelperTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/1/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
import HibbettSDK
@testable import Hibbett

final class JSONHelperTests: XCTestCase {

    func testLoadingJSON_whenJSONIsValid() {
        let data = JSONHelper.loadJSONFile("Theme", bundle: Bundle(for: Hibbett.HibbettDependencyManager.self))
        XCTAssertNotNil(data)
    }

    func testLoadingJSON_whenJSONFileDoesntExist() {
        let data = JSONHelper.loadJSONFile("123456", bundle: Bundle(for: Hibbett.HibbettDependencyManager.self))
        XCTAssertNil(data)
    }

    func testGettingJSON_whenJSONIsValid() {
        do {
            _ = try JSONHelper.getJSON("Theme", bundle: Bundle(for: Hibbett.HibbettDependencyManager.self))
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }

    }

    func testGettingJSON_whenJSONFileDoesntExist() {
        do {
            _ = try JSONHelper.getJSON("123456", bundle: Bundle(for: JSONHelperTests.self))
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }

    }

    func testGettingJSON_whenJSONIsInvalid() {
        do {
            _ = try JSONHelper.getJSON("FakeJSON", bundle: Bundle(for: JSONHelperTests.self))
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }

    }

}
