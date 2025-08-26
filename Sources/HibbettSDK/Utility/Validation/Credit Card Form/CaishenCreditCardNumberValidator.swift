//
//  CaishenCreditCardNumberValidator.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Caishen
import Foundation

/// Validates credit card numbers using Caishen library.
public final class CaishenCreditCardNumberValidator: CreditCardNumberValidator {
    
    // MARK: - Protocol conformance
    
    // MARK: CreditCardNumberValidator
    
    public func luhnCheck(creditCardNumber: String, creditCardType: CreditCardType) -> Bool {
        let validationResult = creditCardType.caishenCardType()
            .numberIsValidLuhn(Number(rawValue: creditCardNumber))
        
        switch validationResult {
        case .Valid:
            return true
        case .LuhnTestFailed:
            return false
        default:
            assertionFailure("Unexpected state")
            return false
        }
    }
    
    public func isCVVValid(_ cvv: String, creditCardType: CreditCardType) -> Bool {
        let caishenCVV = CVC(rawValue: cvv)
        let validationResult = creditCardType.caishenCardType().validate(cvc: caishenCVV)
        
        if validationResult.contains(.InvalidCVC)
            || validationResult.contains(.CVCIncomplete) {
            return false
        }
        
        return true
    }
    
}
