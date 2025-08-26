//
//  DeepLinkParser.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Deep link parser protocol. Defines how to parse a deep link.
public protocol DeepLinkParser {

    /// Parses the given URL and returns the deep link destination.
    ///
    /// - Parameter url: The URL to parse.
    /// - Returns: The deep link destination.
    func parse(url: URL) throws -> DeepLinkDestination

}
