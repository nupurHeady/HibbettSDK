//
//  Caishen+Hibbett.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/17/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import Caishen

extension Caishen.Card {
    
    /// Creates instance of Card with invalid values.
    ///
    /// - Returns: Invalid instance.
    public static func invalid() -> Caishen.Card {
        return Card(number: Number(rawValue: ""),
                    cvc: CVC(rawValue: ""),
                    expiry: Expiry.invalid)
    }
    
    /// Whether the current Card's expiration date is invalid.
    ///
    /// - Returns: True if invalid, false otherwise.
    public func isExpirationDateInvalid() -> Bool {
        return expiryDate.month == Expiry.invalid.month
            && expiryDate.year == Expiry.invalid.year
    }
    
    /// Creates new instance with text values trimmed of whitespace.
    public func trimmed() -> Caishen.Card {
        return Card(number: Number(rawValue: bankCardNumber.rawValue.trim()),
                    cvc: CVC(rawValue: cardVerificationCode.rawValue.trim()),
                    expiry: expiryDate)
    }
    
}

extension CreditCardType {
    
    /// All Hibbett card types converted to Caishen card types.
    ///
    /// - Returns: Caishen card types.
    public static func caishenCardTypes() -> [Caishen.CardType] {
        return CreditCardType.allValues.map { $0.caishenCardType() }
    }
    
    /// Hibbett card type from Caishen card type.
    ///
    /// - Parameter caishenCardType: Caishen card type.
    /// - Returns: Hibbett card type.
    public static func fromCaishenCardType(_ caishenCardType: Caishen.CardType) -> CreditCardType? {
        switch caishenCardType {
        case is AmericanExpress:
            return .americanExpress
        case is Discover:
            return .discover
        case is MasterCard:
            return .masterCard
        case is Visa:
            return .visa
        default:
            return nil
        }
    }
    
    /// Caishen card type from Hibbett card type.
    ///
    /// - Returns: Caishen card type.
    public func caishenCardType() -> Caishen.CardType {
        switch self {
        case .americanExpress:
            return AmericanExpress()
        case .discover:
            return Discover()
        case .masterCard:
            return MasterCard()
        case .visa:
            return Visa()
        case .unknown:
            return UnknownCardType()
        }
    }
    
}

/// Images for Credit Card and CVC hint to support Caishen control.
public struct CustomCaishenCreditCardImageStore: CardTypeImageStore {
    
    // MARK: - Init/Deinit
    
    public init() { }
    
    // MARK: - Protocol conformance
    
    // MARK: CardTypeImageStore
    
    public func image(for cardType: CardType) -> UIImage? {
        let customPlaceholderCardImage = #imageLiteral(resourceName: "credit_card_placeholder")
        let defaultCaishenCardImage = Bundle.caishenBundle().image(for: cardType)
        
        switch cardType {
        case is UnknownCardType:
            return customPlaceholderCardImage
        default:
            return defaultCaishenCardImage
        }
    }
    
    public func cvcImage(for cardType: CardType) -> UIImage? {
        let defaultCaishenCVCImage = Bundle.caishenBundle().cvcImage(for: cardType)
        return defaultCaishenCVCImage
    }
    
}

extension Bundle {
    
    /// Bundle for Caishen library resources.
    ///
    /// - Returns: Bundle.
    public static func caishenBundle() -> Bundle {
        return Bundle(for: CardTextField.self)
    }
    
}
