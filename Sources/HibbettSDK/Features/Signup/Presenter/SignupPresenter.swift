//
//  SignupPresenter.swift
//  Hibbett
//
//  Created by Luna An on 6/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Sign up presenter.
public protocol SignupPresenter {

    associatedtype SignupViewLogicResultType: SignupViewLogicResult

    /// Sign up presenter output.
    var output: SignupViewLogicResultType! { get }

}
