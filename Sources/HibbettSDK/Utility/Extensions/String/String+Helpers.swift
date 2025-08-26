//
//  String+Helpers.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import typealias CommonCrypto.CC_LONG
import func CommonCrypto.CC_MD5
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import Foundation
import UIKit

public extension String {
    /// Index of provided string in current string.
    ///
    /// - Parameters:
    ///   - string: String to find index of.
    ///   - options: Comparison options.
    /// - Returns: Index if found, nil otherwise.
    func index(of string: String,
               options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }

    /// Filters digits from string.
    ///
    /// - Returns: Digits filtered from string.
    func digitsOnly() -> String {
        let nonDigits = CharacterSet.decimalDigits.inverted
        return components(separatedBy: nonDigits).joined()
    }

    /// Trims whitespace.
    ///
    /// - Returns: String trimmed of whitespace.
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Transforms an HTML string into an attributed string with attributes specified by the HTML.
    ///
    /// - Returns: An `NSAttributedString` representing the HTML string or nil if the conversion failed.
    func htmlToAttributedString() -> NSAttributedString? {
        guard let stringData = data(using: String.Encoding.utf8) else {
            return nil
        }

        do {
            let attributes: [NSAttributedString.DocumentReadingOptionKey: Any]
                = [.documentType: NSAttributedString.DocumentType.html,
                   .characterEncoding: String.Encoding.utf8.rawValue]
            return try NSAttributedString(data: stringData, options: attributes, documentAttributes: nil)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    /// Transform an HTML string into a string containing the content of the HTML string.
    ///
    /// - Returns: A string representing the content of an HTML string or nil if the conversion failed.
    func htmlToString() -> String? {
        return htmlToAttributedString()?.string
    }

    /// Whether the provided string is nil or empty.
    ///
    /// - Parameter string: Optional string.
    /// - Returns: True if the string is nil or empty, false otherwise.
    static func isNilOrEmpty(_ string: String?) -> Bool {
        return (string == nil) ? true : string!.trim().isEmpty
    }

    /// Returns the number format  price given the formatted currency string and the locale to use.
    ///
    /// - Parameters:
    ///   - locale: The locale to use for the currency.
    /// - Returns: The price in number format.
    /// - Throws: A NumberFormatterError.
    func price(locale: Locale = Locale(
        identifier: BusinessConstants.LocaleIdentifier.enUSLocaleIdentifier)) throws -> NSNumber {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale

        guard let number = numberFormatter.number(from: self) else {
            throw NumberFormatterError.formattingFailed
        }

        return number
    }

    /// Generates MD5 has from String
    /// - Returns: MD5 hash
    func generateMD5Hash() -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = self.data(using: .utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress,
                   let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData.base64EncodedString()
    }

    func accessibilityIdentifierFor(_ forType: String) -> String {
        return self.lowercased().replacingOccurrences(of: " ", with: "-").appending("-\(forType)")
    }
}
