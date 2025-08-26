//
//  SignupBusinessLogicRequest.swift
//  Hibbett
//
//  Created by Luna An on 6/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Sign up business logic request protocol.
public protocol SignupBusinessLogicRequest {

    /// Sign the user up.
    ///
    /// - Parameters:
    ///   - firstNAme: First name.
    ///   - lastName: Last name.
    ///   - email: Email.
    ///   - didAgreeToEmailSubscription: Boolean value that indicates if the user agreed
    ///                                  to receive updates via email upon sign up.
    ///   - password: Password.
    func signup(firstName: String, lastName: String, email: String, didAgreeToEmailSubscription: Bool, password: String)

}
