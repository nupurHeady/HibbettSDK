//
//  Errorable.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Defines behavior when an error occurs.
public protocol Errorable {

    /// Indicates when an error occured.
    ///
    /// - Parameter error: The error that occured.
    func errorOccured(error: Swift.Error)

}
