//
//  User.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// User.
public protocol User {
    /// User resource id.
    var resourceId: String? { get }

    /// First name.
    var firstName: String? { get }

    /// Last name.
    var lastName: String { get }

    /// Phone number.
    var phone: String? { get }

    /// Email address.
    var email: String { get }

    /// Indicates if the user is a guest
    var isGuest: Bool { get }

    /// Nike connected partnership id token.
    var nikeIdToken: String? { get }

    /// Nike connected partnership linked or not.
    var isNikeLinked: Bool? { get }

    /// Nike connected partnership refresh token.
    var nikeRefreshToken: String? { get }

    /// Customer number for Braze
    var customerNumber: String? { get }

    /// User ownId data.
    var ownIdData: String? { get }
}
