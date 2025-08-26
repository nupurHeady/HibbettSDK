//
//  EmailValidator.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Email validation error.
///
/// - invalidFormat: The email has an invalid format.
public enum EmailValidationError: Swift.Error, Equatable {
    case invalidFormat
}

public func ==(lhs: EmailValidationError, rhs: EmailValidationError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidFormat, .invalidFormat):
        return true
    }
}

/// Email validator.
public final class EmailValidator {

    // MARK: - Init/Deinit

    public init() {

    }

    // MARK: - Instance functions

    /// Indicates if the given email is valid, following Hibbett rules.
    ///
    /// - Parameter email: The email to validate.
    /// - Returns: The validation result.
    public func isEmailValid(email: String) -> ValidationResult<EmailValidationError> {
        if email.isEmailValid() {
            return .valid
        }

        return .invalid([EmailValidationError.invalidFormat])
    }

}
