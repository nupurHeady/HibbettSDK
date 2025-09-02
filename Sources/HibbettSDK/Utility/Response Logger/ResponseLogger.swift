//
//  ResponseLogger.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 9/6/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Used to record JSON responses from the API.
public final class ResponseLogger {

    // MARK: - Properties

    /// Shared instance.
    nonisolated(unsafe) public static let shared = ResponseLogger()

    // MARK: Private properties

    private var _lastResponse: Any?

    // MARK: - Init/Deinit

    public init() {
        _lastResponse = nil
    }

    // MARK: - Instance functions

    /// Logs a response. This will subsequently be reported as lastResponse().
    ///
    /// - Parameter response: Response to record.
    public func logResponse(_ response: (json: Any, statusCode: Int?)?) {
        _lastResponse = response?.json
    }

    /// Last response recorded.
    ///
    /// - Returns: Last response recorded.
    public func lastResponse() -> Any? {
        return _lastResponse
    }

}
