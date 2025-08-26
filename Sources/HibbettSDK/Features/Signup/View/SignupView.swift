//
//  SignupView.swift
//  Hibbett
//
//  Created by Luna An on 6/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Sign up view protocol.
public protocol SignupView: HasDefaultViewDependencies {

    /// The sign up view output.
    var output: SignupBusinessLogicRequest! { get }

}
