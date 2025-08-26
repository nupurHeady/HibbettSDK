//
//  CreditCardFormValidator.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/14/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Caishen
import Foundation
import GenericValidator

/// Credit card form validator.
// swiftlint:disable function_parameter_count
public final class CreditCardFormValidator {
    
    // MARK: - Properties
    
    /// Calendar.
    public let calendar: Calendar
    
    /// Credit card number validator.
    public let creditCardNumberValidator: CreditCardNumberValidator
    
    /// Caishen Card Type register shared by UI control and validator.
    public let caishenCardTypeRegister: CardTypeRegister = CardTypeRegister.sharedCardTypeRegister
    
    // MARK: - Init/Deinit
    
    public init(calendar: Calendar = Calendar.current,
                creditCardNumberValidator: CreditCardNumberValidator) {
        self.calendar = calendar
        self.creditCardNumberValidator = creditCardNumberValidator
    }
    
    // MARK: - Instance functions
    
    // swiftlint:disable cyclomatic_complexity function_body_length
    public func isCreditCardFormDataValid(nameOnCard: String?,
                                          creditCardNumber: String?,
                                          cvv: String?,
                                          expirationMonth: String?,
                                          expirationYear: String?,
                                          creditCardType: CreditCardType?)
        -> ValidationResult<CreditCardFormValidationError> {
            var validationErrors: [CreditCardFormValidationError] = []
            
            if nameOnCard == nil || nameOnCard?.trim().isEmpty == true {
                validationErrors.append(.missingCardholderName)
            }
            
            if creditCardNumber == nil {
                validationErrors.append(.missingCreditCardNumber)
            }
            
            if cvv == nil {
                validationErrors.append(.missingCVV)
            }
            
            if expirationMonth == nil {
                validationErrors.append(.missingExpirationMonth)
            }
            
            if expirationYear == nil {
                validationErrors.append(.missingExpirationYear)
            }
            
            if creditCardType == nil {
                validationErrors.append(.missingCreditCardType)
            }
            
            guard
                let creditCardNumber = creditCardNumber,
                let cvv = cvv,
                let expirationMonth = expirationMonth,
                let expirationYear = expirationYear,
                let creditCardType = creditCardType else {
                    return .invalid(validationErrors)
            }
            
            guard let caishenExpirationDate = Expiry(month: expirationMonth, year: expirationYear) else {
                validationErrors.append(.invalidExpirationDate)
                return .invalid(validationErrors)
            }
            
            let caishenCreditCardNumber = Number(rawValue: creditCardNumber)
            let caishenCVV = CVC(rawValue: cvv)
            let caishenCardType = caishenCardTypeRegister.cardType(for: caishenCreditCardNumber)
            let caishenValidationResult = caishenCardType.validate(number: caishenCreditCardNumber)
                .union(caishenCardType.validate(cvc: caishenCVV))
                .union(caishenCardType.validate(expiry: caishenExpirationDate))
            
            if caishenValidationResult.contains(.NumberDoesNotMatchType)
                || caishenValidationResult.contains(.NumberIncomplete)
                || caishenValidationResult.contains(.NumberIsNotNumeric)
                || caishenValidationResult.contains(.NumberTooLong)
                || caishenValidationResult.contains(.UnknownType) {
                validationErrors.append(.invalidCreditCardNumber)
            }
            
            if !creditCardNumberValidator.isCVVValid(cvv, creditCardType: creditCardType) {
                validationErrors.append(.invalidCVV)
            }
            
            if caishenValidationResult.contains(.CardExpired) {
                validationErrors.append(.expirationDateInPast)
            }
            
            if caishenValidationResult.contains(.InvalidExpiry) {
                validationErrors.append(.invalidExpirationDate)
            }
            
            if !creditCardNumberValidator.luhnCheck(creditCardNumber: creditCardNumber,
                                                    creditCardType: creditCardType) {
                validationErrors.append(.invalidCreditCardNumber)
            }
            
            if validationErrors.isEmpty {
                return .valid
            } else {
                return .invalid(validationErrors)
            }
    }
    
}
