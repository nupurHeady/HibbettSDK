//
//  PhoneNumberTextFieldFormatTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class PhoneNumberTextFieldFormatTests: XCTestCase {

    let textField = UITextField()
    let textFieldHandler = FakeTextFieldDelegateHandler()

    func testPhoneNumberFormat_whenTextFieldTextIsNil() {
        // Given
        textField.text = nil

        // When
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: NSRange(),
                                                replacementString: "")

        // Then
        XCTAssertTrue(result)
    }

    func testPhoneNumberFormat_whenPhoneNumberIsCompleteAndValid() {
        // Given
        let phoneNumber = "1234567890"
        textField.text = phoneNumber

        // When
        let expectedPhoneNumber = "(123) 456-7890"
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: NSRange(),
                                                replacementString: "")

        // Then
        XCTAssertFalse(result)
        XCTAssertEqual(textField.text, expectedPhoneNumber)
    }

    func testPhoneNumberFormat_whenPhoneNumberIsIncompleteButStillValid_andFormattingHasntStarted() {
        // Given
        let phoneNumber = "12"
        textField.text = phoneNumber

        // When
        let expectedPhoneNumber = "123"
        let range = NSRange(location: phoneNumber.count, length: 0)
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: range,
                                                replacementString: "3")

        // Then
        XCTAssertFalse(result)
        XCTAssertEqual(textField.text, expectedPhoneNumber)
    }

    func testPhoneNumberFormat_whenPhoneNumberIsIncompleteButStillValid_andFirstFormattingPartHasStarted() {
        // Given
        let phoneNumber = "123"
        textField.text = phoneNumber

        // When
        let expectedPhoneNumber = "(123) 1"
        let range = NSRange(location: phoneNumber.count, length: 0)
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: range,
                                                replacementString: "1")

        // Then
        XCTAssertFalse(result)
        XCTAssertEqual(textField.text, expectedPhoneNumber)
    }

    func testPhoneNumberFormat_whenPhoneNumberIsIncompleteButStillValid_andSecondFormattingPartHasStarted() {
        // Given
        let phoneNumber = "(123) 123"
        textField.text = phoneNumber

        // When
        let expectedPhoneNumber = "(123) 123-4"
        let range = NSRange(location: phoneNumber.count, length: 0)
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: range,
                                                replacementString: "4")

        // Then
        XCTAssertFalse(result)
        XCTAssertEqual(textField.text, expectedPhoneNumber)
    }

    func testPhoneNumberFormat_whenPhoneNumberIsInvalid_withTooManyDigits() {
        // Given
        let phoneNumber = "123456789012345"
        textField.text = phoneNumber

        // When
        let expectedPhoneNumber = "123456789012345"
        let range = NSRange(location: phoneNumber.count, length: 0)
        let result = textFieldHandler.textField(textField,
                                                shouldChangeCharactersIn: range,
                                                replacementString: "1")

        // Then
        XCTAssertFalse(result)
        XCTAssertEqual(textField.text, expectedPhoneNumber)
    }

}

final class FakeTextFieldDelegateHandler: NSObject, UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return formatPhoneNumber(textField: textField,
                                 shouldChangeCharactersIn: range,
                                 replacementString: string)
    }

}
