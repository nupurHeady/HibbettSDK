//
//  OAuthSessionManagerDelegate.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 10/11/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Handles behaviors required by Session Manager outside of its responsibilities.
public protocol OAuthSessionManagerDelegate: class {

    /// Session persisted to device, if any.
    ///
    /// - Returns: Session if persisted, nil otherwise.
    func savedSession() -> OAuthSession?
    
    /// Informs delegate a new sessoin was retrieved so delegate
    /// can perform additional processing.
    ///
    /// - Parameters:
    ///   - session: New session.
    ///   - completion: Completion with new session.
    func didCreateNewSession(_ session: OAuthSession,
                             completion: @escaping (Swift.Error?) -> Void)

}
