//
//  BugReporter.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Bug reporter protocol.
public protocol BugReporter {

    /// Sets up the bug reporter.
    func start()

    /// Invokes the bug reporter to report a bug.
    func invoke()

}
