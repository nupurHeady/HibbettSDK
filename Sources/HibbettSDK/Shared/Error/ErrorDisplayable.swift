//
//  ErrorDisplayable.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Defines how to display an error.
public protocol ErrorDisplayable {

    /// Displays the error.
    ///
    /// - Parameter error: The error to display.
    func displayError(error: Swift.Error)

}
