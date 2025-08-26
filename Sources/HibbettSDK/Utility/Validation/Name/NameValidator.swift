//
//  NameValidator.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import GenericValidator

/// Name validation error.
///
/// - isEmpty: The name is empty.
/// - overlimit: Exceeds the given Limit..
/// - lessThanMinCharacters: Less then Min Characters
/// - invalidCharacters: Contains Characters outside the allowed character set.
public enum NameValidationError: Swift.Error, Equatable {
    case isEmpty
    case overlimit
    case lessThanMinCharacters
    case invalidCharacters
}

public func ==(lhs: NameValidationError, rhs: NameValidationError) -> Bool {
    switch (lhs, rhs) {
    case (.isEmpty, .isEmpty):
        return true
    case (.overlimit, .overlimit):
        return true
    case (.lessThanMinCharacters, .lessThanMinCharacters):
        return true
    case (.invalidCharacters, .invalidCharacters):
        return true
    default:
        return false
    }
}

/// Name validator.
public final class NameValidator {

    /// Allowing characters: A-Z and . ' -
    public let allowedCharacterSet = "^[A-Za-z][-‘’'.A-Za-z]*$"
    
    /// Minimum Length
    public let minLength = 2
        
    // MARK: - Init/Deinit

    public init() {

    }

    // MARK: - Instance functions

    /// Indicates if the given name is valid, following Hibbett rules.
    ///
    /// - Parameters:
    ///   - name: The name to validate.
    ///   - limit: Character limit.
    ///   - minLength: Minimum characters required
    ///   - allowedCharacters: Allowed Characters in name as Regex string
    /// - Returns: The validation result.
    public func isNameValid(name: String?,
                            limit: Int? = nil,
                            minLength: Int? = nil,
                            allowedCharacters: String? = nil) -> ValidationResult<NameValidationError> {
        var validationErrors: [NameValidationError] = []
        
        if String.isNilOrEmpty(name) {
            validationErrors.append(.isEmpty)
        }
        
        if let name = name, let limit = limit, name.count > limit {
            validationErrors.append(.overlimit)
        }
        
        if let name = name, let minLength = minLength, name.count < minLength {
            validationErrors.append(.lessThanMinCharacters)
        }
        
        if let name = name, let allowedCharacters = allowedCharacters,
           (hasAllowedCharacters(text: name,
                                 allowedCharacters: allowedCharacters) != .valid) {
            validationErrors.append(.invalidCharacters)
        }
        
        if validationErrors.isEmpty {
            return .valid
        }
        
        return .invalid(validationErrors)
    }

    private func hasAllowedCharacters(text: String,
                                     allowedCharacters: String) -> ValidationResult<NameValidationError> {
        if text.evaluate(with: allowedCharacters) {
            return .valid
        }
        
        return .invalid([NameValidationError.invalidCharacters])
    }
}
