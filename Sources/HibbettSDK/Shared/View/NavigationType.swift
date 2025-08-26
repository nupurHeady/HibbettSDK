//
//  NavigationType.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Describes the different ways of navigating to a view controller.
///
/// - push: Push navigation.
/// - present: Modal navigation.
public enum NavigationType {
    case push, present, unknown
}
