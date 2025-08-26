//
//  SignupPasswordValidatorTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/14/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator
import XCTest
@testable import HibbettSDK

// swiftlint:disable file_length
class SignupPasswordValidatorTests: XCTestCase {

    var validator = SignupPasswordValidator()

    // MARK: - Test Individual Validation Functions

    func testValidator_hasAtLeastANumber_valid_whenNumberIsAtTheBeginning() {
        // Given
        let password = "1test"
        let result = validator.hasAtLeastANumber(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastANumber_valid_whenNumberIsInTheMiddle() {
        // Given
        let password = "te1st"
        let result = validator.hasAtLeastANumber(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastANumber_valid_whenNumberIsAtTheEnd() {
        // Given
        let password = "test1"
        let result = validator.hasAtLeastANumber(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastANumber_invalid() {
        // Given
        let password = "test"
        let result = validator.hasAtLeastANumber(text: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastEightCharacters_valid() {
        // Given
        let password = "test#gw1"
        let result = validator.hasAtLeastEightCharacters(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastEightCharacters_invalid() {
        // Given
        let password = "test"
        let result = validator.hasAtLeastEightCharacters(text: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneUppercaseCharacter_valid_whenUppercaseCharactherIsAtTheBeginning() {
        // Given
        let password = "Htesttest"
        let result = validator.hasAtLeastOneUppercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneUppercaseCharacter_valid_whenUppercaseCharactherIsInTheMiddle() {
        // Given
        let password = "testHtest"
        let result = validator.hasAtLeastOneUppercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneUppercaseCharacter_valid_whenUppercaseCharactherIsAtTheEnd() {
        // Given
        let password = "testtestH"
        let result = validator.hasAtLeastOneUppercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneUppercaseCharacter_invalid() {
        // Given
        let password = "testhtest"
        let result = validator.hasAtLeastOneUppercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noUppercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneLowercaseCharacter_valid_whenLowercaseCharacterIsAtTheBeginning() {
        // Given
        let password = "hTESTTEST"
        let result = validator.hasAtLeastOneLowercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneLowercaseCharacter_valid_whenLowercaseCharacterIsInTheMiddle() {
        // Given
        let password = "TESThTEST"
        let result = validator.hasAtLeastOneLowercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneLowercaseCharacter_valid_whenLowercaseCharacterIsAtTheEnd() {
        // Given
        let password = "TESTTESTh"
        let result = validator.hasAtLeastOneLowercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidator_hasAtLeastOneLowercaseCharacter_invalid() {
        // Given
        let password = "TESTHTEST"
        let result = validator.hasAtLeastOneLowercaseCharacter(text: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }
    
    func testValidator_hasAtLeastOneSpecialCharacter_valid_whenSpecialCharacterIsAtTheBeginning() {
        // Given
        let password = "$TESTTESTh"
        let password1 = "%TESTTESTh"
        let password2 = "/TESTTESTh"
        let password3 = "(TESTTESTh"
        let password4 = ")TESTTESTh"
        let password5 = "[TESTTESTh"
        let password6 = "]TESTTESTh"
        let password7 = "{TESTTESTh"
        let password8 = "}TESTTESTh"
        let password9 = "=TESTTESTh"
        let password10 = "?TESTTESTh"
        let password11 = "!TESTTESTh"
        let password12 = ".TESTTESTh"
        let password13 = ",TESTTESTh"
        let password14 = "-TESTTESTh"
        let password15 = "_TESTTESTh"
        let password16 = "*TESTTESTh"
        let password17 = "|TESTTESTh"
        let password18 = "+TESTTESTh"
        let password19 = "~TESTTESTh"
        let password20 = "#TESTTESTh"
        
        let result = validator.hasAtLeastOneSpecialCharacter(text: password)
        let result1 = validator.hasAtLeastOneSpecialCharacter(text: password1)
        let result2 = validator.hasAtLeastOneSpecialCharacter(text: password2)
        let result3 = validator.hasAtLeastOneSpecialCharacter(text: password3)
        let result4 = validator.hasAtLeastOneSpecialCharacter(text: password4)
        let result5 = validator.hasAtLeastOneSpecialCharacter(text: password5)
        let result6 = validator.hasAtLeastOneSpecialCharacter(text: password6)
        let result7 = validator.hasAtLeastOneSpecialCharacter(text: password7)
        let result8 = validator.hasAtLeastOneSpecialCharacter(text: password8)
        let result9 = validator.hasAtLeastOneSpecialCharacter(text: password9)
        let result10 = validator.hasAtLeastOneSpecialCharacter(text: password10)
        let result11 = validator.hasAtLeastOneSpecialCharacter(text: password11)
        let result12 = validator.hasAtLeastOneSpecialCharacter(text: password12)
        let result13 = validator.hasAtLeastOneSpecialCharacter(text: password13)
        let result14 = validator.hasAtLeastOneSpecialCharacter(text: password14)
        let result15 = validator.hasAtLeastOneSpecialCharacter(text: password15)
        let result16 = validator.hasAtLeastOneSpecialCharacter(text: password16)
        let result17 = validator.hasAtLeastOneSpecialCharacter(text: password17)
        let result18 = validator.hasAtLeastOneSpecialCharacter(text: password18)
        let result19 = validator.hasAtLeastOneSpecialCharacter(text: password19)
        let result20 = validator.hasAtLeastOneSpecialCharacter(text: password20)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result1, expectedResult)
        XCTAssertEqual(result2, expectedResult)
        XCTAssertEqual(result3, expectedResult)
        XCTAssertEqual(result4, expectedResult)
        XCTAssertEqual(result5, expectedResult)
        XCTAssertEqual(result6, expectedResult)
        XCTAssertEqual(result7, expectedResult)
        XCTAssertEqual(result8, expectedResult)
        XCTAssertEqual(result9, expectedResult)
        XCTAssertEqual(result10, expectedResult)
        XCTAssertEqual(result11, expectedResult)
        XCTAssertEqual(result12, expectedResult)
        XCTAssertEqual(result13, expectedResult)
        XCTAssertEqual(result14, expectedResult)
        XCTAssertEqual(result15, expectedResult)
        XCTAssertEqual(result16, expectedResult)
        XCTAssertEqual(result17, expectedResult)
        XCTAssertEqual(result18, expectedResult)
        XCTAssertEqual(result19, expectedResult)
        XCTAssertEqual(result20, expectedResult)
    }
    
    func testValidator_hasAtLeastOneSpecialCharacter_valid_whenSpecialCharacterIsAtTheMiddle() {
        // Given
        let password = "TEST$TESTh"
        let password1 = "TEST%TESTh"
        let password2 = "TEST/TESTh"
        let password3 = "TEST(TESTh"
        let password4 = "TEST)TESTh"
        let password5 = "TEST[TESTh"
        let password6 = "TEST]TESTh"
        let password7 = "TEST{TESTh"
        let password8 = "TEST}TESTh"
        let password9 = "TEST=TESTh"
        let password10 = "TEST?TESTh"
        let password11 = "TEST!TESTh"
        let password12 = "TEST.TESTh"
        let password13 = "TEST,TESTh"
        let password14 = "TEST-TESTh"
        let password15 = "TEST_TESTh"
        let password16 = "TEST*TESTh"
        let password17 = "TEST|TESTh"
        let password18 = "TEST+TESTh"
        let password19 = "TEST~TESTh"
        let password20 = "TEST#TESTh"
        
        let result = validator.hasAtLeastOneSpecialCharacter(text: password)
        let result1 = validator.hasAtLeastOneSpecialCharacter(text: password1)
        let result2 = validator.hasAtLeastOneSpecialCharacter(text: password2)
        let result3 = validator.hasAtLeastOneSpecialCharacter(text: password3)
        let result4 = validator.hasAtLeastOneSpecialCharacter(text: password4)
        let result5 = validator.hasAtLeastOneSpecialCharacter(text: password5)
        let result6 = validator.hasAtLeastOneSpecialCharacter(text: password6)
        let result7 = validator.hasAtLeastOneSpecialCharacter(text: password7)
        let result8 = validator.hasAtLeastOneSpecialCharacter(text: password8)
        let result9 = validator.hasAtLeastOneSpecialCharacter(text: password9)
        let result10 = validator.hasAtLeastOneSpecialCharacter(text: password10)
        let result11 = validator.hasAtLeastOneSpecialCharacter(text: password11)
        let result12 = validator.hasAtLeastOneSpecialCharacter(text: password12)
        let result13 = validator.hasAtLeastOneSpecialCharacter(text: password13)
        let result14 = validator.hasAtLeastOneSpecialCharacter(text: password14)
        let result15 = validator.hasAtLeastOneSpecialCharacter(text: password15)
        let result16 = validator.hasAtLeastOneSpecialCharacter(text: password16)
        let result17 = validator.hasAtLeastOneSpecialCharacter(text: password17)
        let result18 = validator.hasAtLeastOneSpecialCharacter(text: password18)
        let result19 = validator.hasAtLeastOneSpecialCharacter(text: password19)
        let result20 = validator.hasAtLeastOneSpecialCharacter(text: password20)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result1, expectedResult)
        XCTAssertEqual(result2, expectedResult)
        XCTAssertEqual(result3, expectedResult)
        XCTAssertEqual(result4, expectedResult)
        XCTAssertEqual(result5, expectedResult)
        XCTAssertEqual(result6, expectedResult)
        XCTAssertEqual(result7, expectedResult)
        XCTAssertEqual(result8, expectedResult)
        XCTAssertEqual(result9, expectedResult)
        XCTAssertEqual(result10, expectedResult)
        XCTAssertEqual(result11, expectedResult)
        XCTAssertEqual(result12, expectedResult)
        XCTAssertEqual(result13, expectedResult)
        XCTAssertEqual(result14, expectedResult)
        XCTAssertEqual(result15, expectedResult)
        XCTAssertEqual(result16, expectedResult)
        XCTAssertEqual(result17, expectedResult)
        XCTAssertEqual(result18, expectedResult)
        XCTAssertEqual(result19, expectedResult)
        XCTAssertEqual(result20, expectedResult)
    }
    
    func testValidator_hasAtLeastOneSpecialCharacter_valid_whenSpecialCharacterIsAtTheEnd() {
        // Given
        let password = "TESTTESTh$"
        let password1 = "TESTTESTh%"
        let password2 = "TESTTESTh/"
        let password3 = "TESTTESTh("
        let password4 = "TESTTESTh)"
        let password5 = "TESTTESTh["
        let password6 = "TESTTESTh]"
        let password7 = "TESTTESTh{"
        let password8 = "TESTTESTh}"
        let password9 = "TESTTESTh="
        let password10 = "TESTTESTh?"
        let password11 = "TESTTESTh!"
        let password12 = "TESTTESTh."
        let password13 = "TESTTESTh,"
        let password14 = "TESTTESTh-"
        let password15 = "TESTTESTh_"
        let password16 = "TESTTESTh*"
        let password17 = "TESTTESTh|"
        let password18 = "TESTTESTh+"
        let password19 = "TESTTESTh~"
        let password20 = "TESTTESTh#"
        
        let result = validator.hasAtLeastOneSpecialCharacter(text: password)
        let result1 = validator.hasAtLeastOneSpecialCharacter(text: password1)
        let result2 = validator.hasAtLeastOneSpecialCharacter(text: password2)
        let result3 = validator.hasAtLeastOneSpecialCharacter(text: password3)
        let result4 = validator.hasAtLeastOneSpecialCharacter(text: password4)
        let result5 = validator.hasAtLeastOneSpecialCharacter(text: password5)
        let result6 = validator.hasAtLeastOneSpecialCharacter(text: password6)
        let result7 = validator.hasAtLeastOneSpecialCharacter(text: password7)
        let result8 = validator.hasAtLeastOneSpecialCharacter(text: password8)
        let result9 = validator.hasAtLeastOneSpecialCharacter(text: password9)
        let result10 = validator.hasAtLeastOneSpecialCharacter(text: password10)
        let result11 = validator.hasAtLeastOneSpecialCharacter(text: password11)
        let result12 = validator.hasAtLeastOneSpecialCharacter(text: password12)
        let result13 = validator.hasAtLeastOneSpecialCharacter(text: password13)
        let result14 = validator.hasAtLeastOneSpecialCharacter(text: password14)
        let result15 = validator.hasAtLeastOneSpecialCharacter(text: password15)
        let result16 = validator.hasAtLeastOneSpecialCharacter(text: password16)
        let result17 = validator.hasAtLeastOneSpecialCharacter(text: password17)
        let result18 = validator.hasAtLeastOneSpecialCharacter(text: password18)
        let result19 = validator.hasAtLeastOneSpecialCharacter(text: password19)
        let result20 = validator.hasAtLeastOneSpecialCharacter(text: password20)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result1, expectedResult)
        XCTAssertEqual(result2, expectedResult)
        XCTAssertEqual(result3, expectedResult)
        XCTAssertEqual(result4, expectedResult)
        XCTAssertEqual(result5, expectedResult)
        XCTAssertEqual(result6, expectedResult)
        XCTAssertEqual(result7, expectedResult)
        XCTAssertEqual(result8, expectedResult)
        XCTAssertEqual(result9, expectedResult)
        XCTAssertEqual(result10, expectedResult)
        XCTAssertEqual(result11, expectedResult)
        XCTAssertEqual(result12, expectedResult)
        XCTAssertEqual(result13, expectedResult)
        XCTAssertEqual(result14, expectedResult)
        XCTAssertEqual(result15, expectedResult)
        XCTAssertEqual(result16, expectedResult)
        XCTAssertEqual(result17, expectedResult)
        XCTAssertEqual(result18, expectedResult)
        XCTAssertEqual(result19, expectedResult)
        XCTAssertEqual(result20, expectedResult)
    }

    // MARK: - Test Final Password Validator

    func testValidatorForPassword_whenValid() {
        // Given
        let password = "testThePassword123456!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber() {
        // Given
        let password = "testThePassword!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_lessThanEightCharacters() {
        // Given
        let password = "testT1!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noUppercaseCharacter() {
        // Given
        let password = "testthepassword12345!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noUppercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noLowercaseCharacter() {
        // Given
        let password = "TESTTHEPASSWORD12345!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }
    
    func testValidatorForPassword_whenInvalid_noSpecialCharacter() {
        // Given
        let password = "TESTTHEPASSWORD12345sdad"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_lessThanEightCharacters_andNoNumber() {
        // Given
        let password = "testT#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noUppercaseCharacter_andNoNumber() {
        // Given
        let password = "testthepassword"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noLowercaseCharacter_andNoNumber() {
        // Given
        let password = "TESTTHEPASSWORD%"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber_andLessThanEightCharacters() {
        // Given
        let password = "teS!t"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noUppercaseCharacter_andLessThanEightCharacters() {
        // Given
        let password = "te1st!"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noLowercaseCharacter_andLessThanEightCharacters() {
        // Given
        let password = "TEST1#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber_andNoUppercaseCharacter() {
        // Given
        let password = "testtesttest"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_lessThanEightCharacters_andNoUppercaseCharacter() {
        // Given
        let password = "tes1#t"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noLowercaseCharacter_andNoUppercaseCharacter() {
        // Given
        let password = "1234567643212345676543#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber_andNoLowercaseCharacter() {
        // Given
        let password = "TESYWIUHFIEUHFI#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_lessThanEightCharacters_andNoLowercaseCharacter() {
        // Given
        let password = "TEST1#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber_lessThanEightCharacters_andNoUppsercaseCharacter() {
        // Given
        let password = "test"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_noNumber_lessThanEightCharacters_andNoLowercaseCharacter() {
        // Given
        let password = "TESTT#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenInvalid_lessThanEightCharacters_noUppercaseCharacter_andNoLowercaseCharacter() {
        // Given
        let password = "123#"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenPasswordIsEmpty_andMatchesAllErrors() {
        // Given
        let password = ""
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noLowercaseCharacter,
                                                       PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenPasswordIsWhiteSpace_andMatchesAllErrors() {
        // Given
        let password = " "
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noLowercaseCharacter,
                                                       PasswordValidationError.noSpecialCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_whenPasswordContainsSpecialCharacters_andMatchesAllErrors() {
        // Given
        let password = "!@#$%^&"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult.invalid([PasswordValidationError.noNumber,
                                                       PasswordValidationError.lessThanEightCharacters,
                                                       PasswordValidationError.noUppercaseCharacter,
                                                       PasswordValidationError.noLowercaseCharacter])

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    func testValidatorForPassword_validComplexPassword() {
        // Given
        let password = "!@iwuhewf#$32525%^EFHUfhffwUFHE&&#*$427834872"
        let result = validator.isPasswordValid(password: password)

        // When
        let expectedResult = ValidationResult<PasswordValidationError>.valid

        // Then
        XCTAssertEqual(result, expectedResult)
    }

}
