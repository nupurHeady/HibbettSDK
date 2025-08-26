//
//  HibbettNumberFormatterTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 7/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class HibbettNumberFormatterTests: XCTestCase {

    let numberFormatter = HibbettNumberFormatter()

    func testPriceNumberFormatting_whenArgumentIsValid_USLocale() {
        // Given
        let number = NSNumber(value: 120)
        let locale = Locale(identifier: "en_US")
        let result = try? numberFormatter.price(fromNumber: number, locale: locale)

        // When
        let expectedResult = "$120.00"

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testPriceNumberFormatting_whenArgumentIsValid_FRLocale() {
        // Given
        let number = NSNumber(value: 120)
        let locale = Locale(identifier: "fr_FR")
        let result = try? numberFormatter.price(fromNumber: number, locale: locale)

        // When
        let expectedResult = "120,00 €"

        // Then
        XCTAssertEqual(result, expectedResult)
    }

}
