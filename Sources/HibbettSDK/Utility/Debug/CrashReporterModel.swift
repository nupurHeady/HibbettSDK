//
//  CrashReporterModel.swift
//  HibbettSDK
//
//  Created by Ram Suthar on 10/07/23.
//  Copyright © 2023 Heady LLC. All rights reserved.
//

import Foundation

/// Error codes for logging
public enum CrashReporterErrorCode: Int {
    case shippingContact = 100
    case invalidCountry = 101
    case updateFullShippingAddress = 102
    case createApplyPayBag = 103
    case updateContact = 104
    case authError = 105
    case noShippingMethodFound = 106
    case getShippingOption = 107
    case setShippingOption = 108
    case serializePaymentToken = 109
    case setShippingAddress = 110
    case setBillingAddress = 111
    case getAddressFromPKContact = 112
    case addPaymentTokenToBag = 113
    case placeOrderWithApplePay = 114
}

/// Error domain for logging
public enum CrashReporterErrorDomain: String {
    case applePay
}

/// Screen name for logging
public enum CrashReporterScreen: String {
    case checkout
    case PDP
}

/// Extra user info for logging
public struct CrashReporterUserInfo {
    
    let userID: String
    let productIDs: [String]
    let screen: CrashReporterScreen
    let isGuest: Bool
    let error: Swift.Error?
    
    public var dictionary: [String: Any] {
        return [
            "UserID": userID,
            "productID": productIDs,
            "screen": screen.rawValue,
            "isGuest": isGuest,
            NSLocalizedDescriptionKey: error?.localizedDescription ?? String()
        ]
    }
    
    public init(userID: String,
                productIDs: [String],
                screen: CrashReporterScreen,
                isGuest: Bool,
                error: Swift.Error?) {
        self.userID = userID
        self.productIDs = productIDs
        self.screen = screen
        self.isGuest = isGuest
        self.error = error
    }
}
