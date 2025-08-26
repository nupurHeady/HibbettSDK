//
//  CrashReporter.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Crash reporter protocol.
public protocol CrashReporter {

    /// Sets up the crash reporter.
    func start()

    /// Makes the app crash using the crash reporter.
    ///
    /// - Note: Useful for testing the crash reporter reporting management.
    func crash()
    
    /// Record a custom error
    /// - Parameter code: error code
    /// - Parameter domain: error domain
    /// - Parameter userInfo: user infof
    func record(code: CrashReporterErrorCode,
                domain: CrashReporterErrorDomain,
                userInfo: CrashReporterUserInfo)
}
