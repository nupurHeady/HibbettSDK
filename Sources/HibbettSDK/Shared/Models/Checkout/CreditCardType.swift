//
//  CreditCardType.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 11/14/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Credit card types accepted by Hibbett.
///
/// - americanExpress: American Express.
/// - discover: Discover.
/// - masterCard: MasterCard.
/// - visa: Visa.
public enum CreditCardType {
    case americanExpress
    case discover
    case masterCard
    case visa
    case unknown
    
    // MARK: - Init/Deinit
    
    public init(value: CreditCardType) {
        self = value
    }
    
    public init(pcfCardType: String?) {
        guard let pcfCardType = pcfCardType else {
            self.init(value: .unknown)
            return
        }
        
        self.init(parameterValue: pcfCardType)
    }
    
    public init(parameterValue: String) {
        switch parameterValue {
        case CreditCardType.americanExpress.toParameterValue():
            self = .americanExpress
        case CreditCardType.discover.toParameterValue():
            self = .discover
        case CreditCardType.masterCard.toParameterValue():
            self = .masterCard
        case CreditCardType.visa.toParameterValue():
            self = .visa
        default:
            self = .unknown
        }
    }
    
    public init(displayValue: String) {
        switch displayValue {
        case CreditCardType.americanExpress.toDisplayValue():
            self = .americanExpress
        case CreditCardType.discover.toDisplayValue():
            self = .discover
        case CreditCardType.masterCard.toDisplayValue():
            self = .masterCard
        case CreditCardType.visa.toDisplayValue():
            self = .visa
        default:
            self = .unknown
        }
    }
    
    // MARK: - Instance functions
    
    /// Converts to value for display on UI.
    ///
    /// - Returns: Display value.
    public func toDisplayValue() -> String {
        switch self {
        case .americanExpress:
            return "American Express"
        case .discover:
            return "Discover"
        case .masterCard:
            return "MasterCard"
        case .visa:
            return "Visa"
        case .unknown:
            return "Unknown"
        }
    }
    
    /// Converts to parameter value usable in HTTP Requests.
    ///
    /// - Returns: Parameter value.
    public func toParameterValue() -> String {
        switch self {
        case .americanExpress:
            return "Amex"
        case .discover:
            return "Discover"
        case .masterCard:
            return "Master Card"
        case .visa:
            return "Visa"
        case .unknown:
            assertionFailure("Unexpected state")
            return ""
        }
    }
    
    // MARK: - Class functions
    
    /// All credit card types.
    nonisolated(unsafe) static let allValues = [CreditCardType.americanExpress, .discover, .masterCard, .visa]
}
