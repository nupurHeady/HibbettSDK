//
//  RewardsNumberValidator.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Rewards Number validation error.
///
/// - invalidFormat: The Rewards Number has an invalid format.
public enum RewardsNumberValidatorError: Swift.Error, Equatable {
    case invalidFormat
}

public func ==(lhs: RewardsNumberValidatorError, rhs: RewardsNumberValidatorError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidFormat, .invalidFormat):
        return true
    }
}

/// Rewards Number validator.
public final class RewardsNumberValidator {

    // MARK: - Init/Deinit

    public init() {

    }

    // MARK: - Instance functions

    /// Indicates if the given Hibbett Rewards Number is valid.
    ///
    /// - Parameter rewardsNumber: The Rewards Number to validate.
    /// - Returns: The validation result.
    public func isRewardsNumberValid(rewardsNumber: String) -> ValidationResult<RewardsNumberValidatorError> {
        let hasCorrectLength = rewardsNumber.count >= BusinessConstants.minimumRewardsNumberLength

        if hasCorrectLength {
            return .valid
        }

        return .invalid([RewardsNumberValidatorError.invalidFormat])
    }

}
