//
//  ZipCodeValidator.swift
//  Hibbett
//
//  Created by Dominic Ancrum on 9/18/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Zip code validation error.
///
/// - invalidFormat: The zip code has an invalid format.
public enum ZipCodeValidationError: Swift.Error {
    case invalidFormat
}

public func ==(lhs: ZipCodeValidationError, rhs: ZipCodeValidationError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidFormat, .invalidFormat):
        return true
    }
}

/// Zip code validator Protocol
public protocol ZipCodeValidatorProtocol {
    
    /// Length of the sip code
    var zipCodeLength: Int { get }
    
    /// validate zip code
    /// - Parameter zipCode: zipcode  string to be validated
    func isZipCodeValid(zipCode: String) -> ValidationResult<ZipCodeValidationError>
}

/// Zip code validator.
public final class ZipCodeValidator: ZipCodeValidatorProtocol {

    public var zipCodeLength: Int {
        return 5
    }

    public func isZipCodeValid(zipCode: String) -> ValidationResult<ZipCodeValidationError> {
        if zipCode.isZipCodeValid() {
            return .valid
        }

        return .invalid([ZipCodeValidationError.invalidFormat])
    }
}

/// US Zip code validator to match Zipcode +4 length format
public final class USZipCodeValidator: ZipCodeValidatorProtocol {

    public var zipCodeLength: Int {
        return 10
    }
    
    public func isZipCodeValid(zipCode: String) -> ValidationResult<ZipCodeValidationError> {
        if zipCode.evaluate(with: "^[0-9]{5}(-[0-9]{4})?$") {
            return .valid
        }

        return .invalid([ZipCodeValidationError.invalidFormat])
    }
}
