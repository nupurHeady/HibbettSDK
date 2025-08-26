//
//  StateMachineTransitionValidator.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/21/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// State machine transition validator protocol. Provides an interface to validate if a transition should happen
/// between 2 states.
public protocol StateMachineTransitionValidator {

    associatedtype State: Hashable

    /// Validates the transition between 2 states.
    ///
    /// - Parameters:
    ///   - from: The current state.
    ///   - to: The next state.
    /// - Returns: `true` if the transition can be performed. `false` if not.
    func shouldTransition(from: State, to: State) -> Bool

}
