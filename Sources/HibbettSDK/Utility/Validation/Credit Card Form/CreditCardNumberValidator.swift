//
//  CreditCardNumberValidator.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Validates credit card nubmers.
public protocol CreditCardNumberValidator {
    
    /// Whether the provided credit card number passes a Luhn check
    /// for the credit card type.
    ///
    /// - Parameters:
    ///   - creditCardType: Credit Card Type.
    ///   - creditCardNumber: Credit Card Number.
    /// - Returns: True if the Credit Card number passes the Luhn check, false otherwise.
    func luhnCheck(creditCardNumber: String, creditCardType: CreditCardType) -> Bool
    
    /// Whether the provided CVV is valid for the credit card type.
    ///
    /// - Parameters:
    ///   - cvv: CVV.
    ///   - creditCardType: Credit Card Type.
    /// - Returns: True if the CVV is valid, false otherwise.
    func isCVVValid(_ cvv: String, creditCardType: CreditCardType) -> Bool
    
}
