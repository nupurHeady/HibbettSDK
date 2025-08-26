//
//  NumberRandomizer.swift
//  Hibbett
//
//  Created by Thibault Klein on 7/11/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Number random helper class.
public struct NumberRandomizer {

    /// Returns a random number given the upper bound.
    ///
    /// - Parameter upperBound: The upper bound to use.
    /// - Returns: A random number between 0 and upper bound value.
    static public func randomNumber(_ upperBound: UInt32) -> UInt32 {
        return arc4random_uniform(upperBound)
    }

}
