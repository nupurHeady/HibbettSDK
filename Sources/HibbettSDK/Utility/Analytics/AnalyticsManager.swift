//
//  AnalyticsManager.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import PCFSwift

/// Analytics manager protocol.
public protocol AnalyticsManager {

    /// Starts the analytics manager.
    func start()

    /// Tracks viewing of the provided screen.
    ///
    /// - Parameter screen: Screen.
    func track(screenView screen: AnalyticsScreen)
    
    /// Track Log In Event.
    ///
    /// - Parameters:
    ///   - user: User that logged in.
    ///   - originScreen: Screen from which the Login originated.
    func trackLogInEvent(userID: String,
                         user: HibbettSDK.User,
                         fromScreen originScreen: String)
    
    /// Tracks Log Out Event.
    func trackLogOutEvent()
    
    /// Track Sign Up Event.
    ///
    /// - Parameters:
    ///   - userID: User ID.
    ///   - user: User that signed up.
    ///   - originScreen: Screen from which the Sign Up originated.
    func trackSignUpEvent(userID: String,
                         user: HibbettSDK.User,
                         fromScreen originScreen: String)
    
    /// Track Signup Event for GA4 Google analytics
    func trackLoyaltySignUpEvent()

}
