//
//  HibbettNumberFormatter.swift
//  Hibbett
//
//  Created by Thibault Klein on 7/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Describes the potential errors when formatting a number.
///
/// - invalidArgument: The given argument isn't a number.
/// - formattingFailed: The formatting failed.
public enum NumberFormatterError: Error {
    case formattingFailed
}

/// Hibbett number formatter.
public final class HibbettNumberFormatter {

    /// Initializes the hibbett number formatter
    public init() { }

    /// Returns the formatted price given the number in a string format, and the locale to use.
    ///
    /// - Parameters:
    ///   - number: The number to format.
    ///   - locale: The locale to use for the currency.
    /// - Returns: The formatted price in string format.
    /// - Throws: A NumberFormatterError.
    public func price(fromNumber number: NSNumber, locale: Locale = Locale(identifier: "en_US")) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale

        guard let formattedNumber = numberFormatter.string(from: number) else {
            throw NumberFormatterError.formattingFailed
        }

        return formattedNumber
    }
    
    /// Returns a number formatted as apercent.
    ///
    /// - Parameters:
    ///   - number: Number to format.
    ///   - numDecimalPlaces: Number of decimal places to use.
    /// - Returns: The formatted number.
    /// - Throws: A NumberFormatterError.
    public func percent(fromNumber number: NSNumber, numDecimalPlaces: Int) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = numDecimalPlaces
        numberFormatter.maximumFractionDigits = numDecimalPlaces
        
        guard let formattedNumber = numberFormatter.string(from: number) else {
            throw NumberFormatterError.formattingFailed
        }
        
        return formattedNumber
    }

}
