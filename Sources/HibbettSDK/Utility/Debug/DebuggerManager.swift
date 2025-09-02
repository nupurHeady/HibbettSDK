//
//  DebuggerManager.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/12/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import PCFSwift
import CoreFeature

/// Debugger manager protocol.
public protocol DebuggerManager {

    /// The environment manager to use for environment switching.
    var environmentManager: HTTPEnvironmentManager { get }

    /// The crash reporter.
    var crashReporter: CrashReporter { get }

    /// Sets up the debugger manager.
    func start()

    /// Re-sets up the debugger manager.
    func restart()

}
