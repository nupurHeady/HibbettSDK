//
//  Success.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/12/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Represents either success or failure.
public protocol Success {

    /// True if successful, false otherwise.
    var value: Bool { get }

}
