//
//  LoginPresenter.swift
//  Hibbett
//
//  Created by Luna An on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Login presenter.
public protocol LoginPresenter {

    associatedtype LoginViewLogicResultType: LoginViewLogicResult

    /// Login presenter output.
    var output: LoginViewLogicResultType! { get }

}
