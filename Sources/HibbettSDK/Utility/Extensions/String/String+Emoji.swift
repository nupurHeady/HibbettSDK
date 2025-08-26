//
//  String+Emoji.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/2/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

public extension String {

    /// Emoji symbol for the unicode string.
    ///
    /// - Warning: Only works with unicode characters.
    ///
    /// `1F600` --> 😃
    ///
    /// `1F603` --> 😍
    ///
    /// `U+1F604` --> `nil`
    ///
    /// `Hello, World!` --> `nil`
    ///
    /// - Source: [Emoji table](http://punchdrunker.github.io/iOSEmoji/table_html/index.html)
    var emoji: String? {
        guard let intValue = Int(self, radix: 16),
            let unicodeValue = UnicodeScalar(intValue) else {
                return nil
        }

        return String(unicodeValue)
    }

}
