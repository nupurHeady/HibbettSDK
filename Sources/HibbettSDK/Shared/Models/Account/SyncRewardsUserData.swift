//
//  SyncRewardsUserData.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 7/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// User data available if a user already has a Rewards account.
public struct SyncRewardsUserData {

    // MARK: - Properties

    /// First name.
    public let firstName: String

    /// Last name.
    public let lastName: String

    /// Email address.
    public let email: String?

    // MARK: - Init

    /// Creates new instance with provided details.
    ///
    /// - Parameters:
    ///   - firstName: First name.
    ///   - lastName: Last name.
    ///   - email: Email.
    public init(firstName: String, lastName: String, email: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }

    // MARK: - Instance functions

    /// Whether an email was provided.
    ///
    /// - Returns: True if an email was provided, false otherwise.
    public func hasEmail() -> Bool {
        return email != nil
    }

}
