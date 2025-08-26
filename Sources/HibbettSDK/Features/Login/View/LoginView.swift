//
//  LoginView.swift
//  Hibbett
//
//  Created by Luna An on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Login view protocol.
public protocol LoginView: AnyObject, HasDefaultViewDependencies {

    /// The product view output.
    var output: LoginBusinessLogicRequest! { get }

}
