//
//  StateEventNotifier.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/20/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//
import UIKit

/// Notifier protocol for state event updates.
/// Use to notifiy when the user performs an action (event) related to a state.
public protocol StateEventNotifier {

    /// Posts the given event so the state machine can identify what the next state should be if applicable.
    ///
    /// - Parameters:
    ///   - event: The event to post.
    ///   - source: The source of the event (user action).
    func postEvent<T: Hashable>(event: T, fromSource source: UIViewController)

}
