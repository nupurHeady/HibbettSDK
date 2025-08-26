//
//  DeepLinkRouter.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Deep link router protocol.
public protocol DeepLinkRouter {

    /// Route the navigation to the given deep link destination.
    ///
    /// - Parameter destination: The deep link destination to go to.
    func route(toDestination destination: DeepLinkDestination, navigationType: NavigationType, onTab: Int?)

}
