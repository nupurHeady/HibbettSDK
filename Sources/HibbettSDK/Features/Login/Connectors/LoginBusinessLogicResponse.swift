//
//  LoginBusinessLogicResponse.swift
//  Hibbett
//
//  Created by Luna An on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// The login business logic response protocol.
public protocol LoginBusinessLogicResponse: Errorable, AccountSyncRequired {

    /// Indicates that Login succedeed.
    ///
    /// - Parameter user: User.
    func loginSucceeded()

}

/// Indicates that Account sync is needed in case corresponding loyalty account exists
public protocol AccountSyncRequired {
    
    /// Indicates loyalty account already exists and account sync required
    func accountSyncRequired()
}
