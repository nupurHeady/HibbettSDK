//
//  SignupViewLogicResult.swift
//  Hibbett
//
//  Created by Luna An on 6/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// The sign up view logic result protocol.
public protocol SignupViewLogicResult: ErrorDisplayable {

    /// Indicates if the sign up succeedeed.
    func signupSucceeded()

}
