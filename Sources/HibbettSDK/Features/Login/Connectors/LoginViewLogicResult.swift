//
//  LoginViewLogicResult.swift
//  Hibbett
//
//  Created by Luna An on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Login view logic result protocol.
public protocol LoginViewLogicResult: class, ErrorDisplayable {

    /// Displays the login display model in a greeting message.
    func loginSucceeded()

}
