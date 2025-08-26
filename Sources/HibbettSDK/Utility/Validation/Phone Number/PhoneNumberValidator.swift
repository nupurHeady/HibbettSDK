//
//  PhoneNumberValidator.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Phone number validation error.
///
/// - invalidFormat: The phone number has an invalid format.
public enum PhoneNumberValidatorError: Swift.Error, Equatable {
    case invalidFormat
}

public func ==(lhs: PhoneNumberValidatorError, rhs: PhoneNumberValidatorError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidFormat, .invalidFormat):
        return true
    }
}

/// Phone number validator.
public final class PhoneNumberValidator {

    // MARK: - Init/Deinit

    public init() {

    }

    // MARK: - Instance functions

    /// Indicates if the given phone number is valid, following Hibbett rules.
    ///
    /// - Parameter phoneNumber: The phone number to validate.
    /// - Returns: The validation result.
    public func isPhoneNumberValid(phoneNumber: String) -> ValidationResult<PhoneNumberValidatorError> {
        if phoneNumber.isPhoneNumberValid() {
            return .valid
        }

        return .invalid([PhoneNumberValidatorError.invalidFormat])
    }

}
