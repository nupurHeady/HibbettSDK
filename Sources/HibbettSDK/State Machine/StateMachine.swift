//
//  StateMachine.swift
//  Hibbett
//
//  Created by Thibault Klein on 4/20/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Generic state machine, capable of providing the event to take based on a defined state.
///
/// - Source: [Link](http://techblog.thescore.com/2016/04/19/using-state-machines-to-handle-workflows/)
open class StateMachine<State, Event, Validator>
where Event: Hashable, Validator: StateMachineTransitionValidator, Validator.State == State {

    /// The current state.
    public var currentState: State

    /// The state transition validator.
    public var transitionValidator: Validator

    private var states: [State: [Event: State]] = [:]

    /// Initializes the state machine with the given initial state.
    ///
    /// - Parameters:
    ///   - initialState: The initial state to use.
    ///   - transitionValidator: The transition validator to use in order to validate if the next state is valid.
    public init(initialState: State, transitionValidator: Validator) {
        self.currentState = initialState
        self.transitionValidator = transitionValidator
    }

    /// Assigns a transition to the given state.
    ///
    /// - Parameter state: The state to use.
    /// - Returns: The associated transition (Event -> State) for the state parameter.
    public subscript(state: State) -> [Event: State]? {
        get {
            return states[state]
        }
        set(transitions) {
            states[state] = transitions
        }
    }

    /// Determines if the given state can trigger a transition to a new state for the current state.
    ///
    /// - Parameter event: The event to trigger the transition.
    /// - Returns: the State we can transition to for the given event.
    public subscript(event: Event) -> State? {
        if let transitions = states[currentState] {
            if let nextState = transitions[event] {
                return nextState
            }
        }

        return nil
    }

    /// Attempts to transition from the current state to the next state.
    ///
    /// - Parameter event: The event to look up the destination State for the current state.
    /// - Returns: The new State saved to current state if the lookup was successful.
    open func transition(event: Event) -> State? {
        if let nextState = self[event] {
            if transitionValidator.shouldTransition(from: currentState, to: nextState) {
                currentState = nextState
                return nextState
            }
        }

        return nil
    }

}
