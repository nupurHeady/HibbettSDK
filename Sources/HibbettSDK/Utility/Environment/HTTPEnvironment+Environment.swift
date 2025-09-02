//
//  HTTPEnvironmentManager+Environment.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/9/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import PCFSwift
import CoreFeature

///// Extensions on PCF Environment model to support Hibbett Environment model.
extension HTTPEnvironment {

    /// Enum value for environment.
    public var value: Environment {
        return Environment(rawValue: name)!
    }

}
