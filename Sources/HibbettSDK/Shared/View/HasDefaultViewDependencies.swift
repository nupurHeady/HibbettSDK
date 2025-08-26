//
//  HasDefaultViewDependencies.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/2/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Describes views that utitlize a set of default dependencies.
public protocol HasDefaultViewDependencies {

    /// Analytics manager used for tracking.
    var analyticsManager: AnalyticsManager { get }

}
