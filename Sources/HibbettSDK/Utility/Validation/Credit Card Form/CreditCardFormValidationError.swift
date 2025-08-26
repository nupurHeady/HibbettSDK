//
//  CreditCardFormValidationError.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/14/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Validation for Credit Card information retrieved from a form.
///
/// - missingCardholderName: Cardholder name is missing
/// - missingCreditCardNumber: Credit card number is missing.
/// - invalidCreditCardNumber: Invalid format for Credit Card number.
/// - missingCVV: CVV is missing.
/// - invalidCVV: Invalid format for CVV.
/// - missingExpirationMonth: Expiration month is missing.
/// - missingExpirationYear: Expiration yaer is missing.
/// - expirationDateInPast: Combination of valid expiration month and year is in the past.
/// - missingExpirationDate: Missing expiration date.
/// - invalidExpirationDate: Issue when trying to compare expiration date to today.
/// - missingCreditCardType: Credit card type is missing.
public enum CreditCardFormValidationError: Swift.Error, Equatable {
    case missingCardholderName
    case missingCreditCardNumber
    case invalidCreditCardNumber
    case missingCVV
    case invalidCVV
    case missingExpirationMonth
    case missingExpirationYear
    case expirationDateInPast
    case invalidExpirationDate
    case missingCreditCardType
}

// MARK: - Protocol conformance

// MARK: Equatable

public func ==(lhs: CreditCardFormValidationError, rhs: CreditCardFormValidationError) -> Bool {
    switch (lhs, rhs) {
    case (.missingCardholderName, .missingCardholderName),
         (.missingCreditCardNumber, .missingCreditCardNumber),
         (.invalidCreditCardNumber, .invalidCreditCardNumber),
         (.missingCVV, .missingCVV),
         (.invalidCVV, .invalidCVV),
         (.missingExpirationMonth, .missingExpirationMonth),
         (.missingExpirationYear, .missingExpirationYear),
         (.expirationDateInPast, .expirationDateInPast),
         (.invalidExpirationDate, .invalidExpirationDate),
         (.missingCreditCardType, .missingCreditCardType):
        return true
    default:
        return false
    }
}
