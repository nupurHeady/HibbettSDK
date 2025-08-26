//
//  SignupPasswordValidator.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/14/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Password validation error.
///
/// - noNumber: The password doesn't contain a number.
/// - lessThanEightCharacters: The password has less than 8 characters.
/// - noUppercaseCharacter: The password doesn't contain a uppercase character.
/// - noLowercaseCharacter: The password doesn't contain a lowercase character.
public enum PasswordValidationError: Swift.Error, Equatable {
    case noNumber
    case lessThanEightCharacters
    case noUppercaseCharacter
    case noLowercaseCharacter
    case noSpecialCharacter
}

public func ==(lhs: PasswordValidationError, rhs: PasswordValidationError) -> Bool {
    switch (lhs, rhs) {
    case (.noNumber, .noNumber):
        return true
    case (.lessThanEightCharacters, .lessThanEightCharacters):
        return true
    case (.noUppercaseCharacter, .noUppercaseCharacter):
        return true
    case (.noLowercaseCharacter, .noLowercaseCharacter):
        return true
    case (.noSpecialCharacter, .noSpecialCharacter):
        return true
    default:
        return false
    }
}

/// Sign up password validator.
public final class SignupPasswordValidator {

    // MARK: - Init/Deinit

    public init() {

    }

    /// Indicates if the given password is valid, following Hibbett rules.
    ///
    /// - Note: Hibbett passwords have to contain:
    /// * At least 1 number
    /// * More than 8 characters
    /// * At least 1 uppercase character
    /// * At least 1 lowercase character
    ///
    /// - Parameter password: The password to validate.
    /// - Returns: The validation result.
    public func isPasswordValid(password: String) -> ValidationResult<PasswordValidationError> {
        return hasAtLeastANumber(text: password)
            .combine(hasAtLeastEightCharacters(text: password))
            .combine(hasAtLeastOneUppercaseCharacter(text: password))
            .combine(hasAtLeastOneLowercaseCharacter(text: password))
            .combine(hasAtLeastOneSpecialCharacter(text: password))
    }

    public func hasAtLeastANumber(text: String) -> ValidationResult<PasswordValidationError> {
        if text.evaluate(with: ".*\\d+.*") {
            return .valid
        }

        return .invalid([PasswordValidationError.noNumber])
    }

    public func hasAtLeastEightCharacters(text: String) -> ValidationResult<PasswordValidationError> {
        if text.evaluate(with: "^.{8,}$") {
            return .valid
        }

        return .invalid([PasswordValidationError.lessThanEightCharacters])
    }

    public func hasAtLeastOneUppercaseCharacter(text: String) -> ValidationResult<PasswordValidationError> {
        if text.evaluate(with: ".*[A-Z]+.*") {
            return .valid
        }

        return .invalid([PasswordValidationError.noUppercaseCharacter])
    }

    public func hasAtLeastOneLowercaseCharacter(text: String) -> ValidationResult<PasswordValidationError> {
        if text.evaluate(with: ".*[a-z]+.*") {
            return .valid
        }

        return .invalid([PasswordValidationError.noLowercaseCharacter])
    }
    
    /// Indicates that the text should have atleast one special character
    /// - Parameter text: Text which needs to be validated
    /// - Returns: Validation Result, valid or invalid
    public func hasAtLeastOneSpecialCharacter(text: String) -> ValidationResult<PasswordValidationError> {
        if text.evaluate(with: ".*[$%/()\\[\\]{}=?!\\.,_*|\\+~#-].*") {
            
            return .valid
        }

        return .invalid([PasswordValidationError.noSpecialCharacter])
    }

}
