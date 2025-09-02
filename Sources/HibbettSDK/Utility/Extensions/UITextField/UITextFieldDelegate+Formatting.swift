//
//  UITextFieldDelegate+Formatting.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UITextFieldDelegate {

    /// Formats the text field text to a Hibbett Rewards Number style.
    ///
    /// ```
    /// XXXXXXXXXXXXXXXX
    /// ```
    /// Call this function in UITextFieldDelegate
    /// `textField(textField:, shouldChangeCharactersIn range:, replacementString string:) -> Bool` function.
    ///
    /// - Parameters:
    ///   - textField: The text field containing the text.
    ///   - range: The range of characters to be replaced.
    ///   - string: The replacement string.
    /// - Returns: `true` if the specified text range should be replaced. `false` to keep the old text.
    func formatRewardsNumber(textField: UITextField,
                             shouldChangeCharactersIn range: NSRange,
                             replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }

        let newLength = (text as NSString).length + (string as NSString).length - range.length as Int

        return (newLength > BusinessConstants.minimumRewardsNumberLength) ? false : true
    }

    /// Formats the text field text to a USA phone number style.
    ///
    /// ```
    /// (XXX) XXX-XXXX
    /// ```
    ///
    /// Call this function in UITextFieldDelegate
    /// `textField(textField:, shouldChangeCharactersIn range:, replacementString string:) -> Bool` function.
    ///
    /// - Parameters:
    ///   - textField: The text field containing the text.
    ///   - range: The range of characters to be replaced.
    ///   - string: The replacement string.
    /// - Returns: `true` if the specified text range should be replaced. `false` to keep the old text.
    @discardableResult
    func formatPhoneNumber(textField: UITextField,
                           shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }

        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        let components = newString.components(separatedBy: CharacterSet.decimalDigits.inverted)

        let decimalString: String = components.joined(separator: "")
        let length = decimalString.count
        let decimalStr = decimalString as NSString

        if length == 0 || length > 10 {
            let newLength = (text as NSString).length + (string as NSString).length - range.length as Int

            return (newLength > 10) ? false : true
        }

        var index = 0 as Int
        let formattedString = NSMutableString()

        if (length - index) > 3 {
            let areaCode = decimalStr.substring(with: NSRange(location: index, length: 3))
            formattedString.appendFormat("(%@) ", areaCode)
            index += 3
        }
        if length - index > 3 {
            let prefix = decimalStr.substring(with: NSRange(location: index, length: 3))
            formattedString.appendFormat("%@-", prefix)
            index += 3
        }

        let remainder = decimalStr.substring(from: index)
        formattedString.append(remainder)
        textField.text = formattedString as String

        return false
    }
    
    /// Returns status either the text entry should be accepted or not
    /// - Parameter textfield: the textfield containing the text
    /// - Parameter string: the replacement string
    /// - Returns: returns status to accept the text or not
    func formatAddressIdentifier(textfield : UITextField,
                                 replacementString string: String) -> Bool{
        let trimmedTFString = textfield.text?.trimmingCharacters(in: .whitespaces) ?? "" //checks if already entered textfield text is valid
        let trimmedString = string.trimmingCharacters(in: .whitespaces) // Checks the current text which is going to be added
        if (trimmedString.isEmpty && trimmedTFString.isEmpty) {
            return false
        }
        return true
    }

}

extension Formatter {
    public static func formatPhoneNumber(text: String) -> String {
        
        let range = NSRange(location: 0, length: text.count)
        let newString = (text as NSString).replacingCharacters(in: range, with: text)
        let components = newString.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        let decimalString: String = components.joined(separator: "")
        let length = decimalString.count
        let decimalStr = decimalString as NSString
        
        if length == 0 || length > 10 {
            let newLength = (text as NSString).length + (text as NSString).length - range.length as Int
            
            return (newLength > 10) ? "" : text
        }
        
        var index = 0 as Int
        let formattedString = NSMutableString()
        
        if (length - index) > 3 {
            let areaCode = decimalStr.substring(with: NSRange(location: index, length: 3))
            formattedString.appendFormat("(%@) ", areaCode)
            index += 3
        }
        if length - index > 3 {
            let prefix = decimalStr.substring(with: NSRange(location: index, length: 3))
            formattedString.appendFormat("%@-", prefix)
            index += 3
        }
        
        let remainder = decimalStr.substring(from: index)
        formattedString.append(remainder)
        
        return formattedString as String
    }
    
    /// Remove formatting characters from give phone number text.
    ///
    /// - Returns: phone number text without formating characters.
    public static func removeFormatFromPhoneNumber(text: String) -> String {
        var cleanedText = text.replacingOccurrences(of: "-", with: "")
        cleanedText = cleanedText.replacingOccurrences(of: "(", with: "")
        cleanedText = cleanedText.replacingOccurrences(of: ")", with: "")
        cleanedText = cleanedText.replacingOccurrences(of: " ", with: "")
        cleanedText = cleanedText.replacingOccurrences(of: ".", with: "")
        cleanedText = cleanedText.replacingOccurrences(of: "/", with: "")
        return cleanedText
    }
}
