//
//  LoginBusinessLogicRequest.swift
//  Hibbett
//
//  Created by Luna An on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Login business logic request protocol.
public protocol LoginBusinessLogicRequest {
    /// Login the user in.
    func logIn(withEmail: String, password: String)

    /// Login using own Id button.
    func ownIdLogIn(trustedToken: String)
}
