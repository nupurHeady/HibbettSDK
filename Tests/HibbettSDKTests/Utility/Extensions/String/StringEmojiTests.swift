//
//  StringEmojiTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/2/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class StringEmojiTests: XCTestCase {

    func testEmoji_whenUnicodeIsValid() {
        // Given
        let grinningFaceUnicode = "1F600"
        // When
        let expectedEmoji = "😀"
        // Then
        XCTAssertEqual(grinningFaceUnicode.emoji, expectedEmoji)
    }

    func testEmoji_whenUnicodeIsInvalid() {
        // Given
        let grinningFaceUnicode = "U+1F600"
        // Then
        XCTAssertNil(grinningFaceUnicode.emoji)
    }

    func testEmoji_whenStringIsInvalid() {
        // Given
        let grinningFaceUnicode = "Hello, World!"
        // Then
        XCTAssertNil(grinningFaceUnicode.emoji)
    }

}
