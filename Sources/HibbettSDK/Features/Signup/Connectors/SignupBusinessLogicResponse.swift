//
//  SignupBusinessLogicResponse.swift
//  Hibbett
//
//  Created by Luna An on 6/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// The sign up business logic response protocol.
public protocol SignupBusinessLogicResponse: Errorable {

    /// Indicates that sign up succedeed.
    func signupSucceeded()

}
