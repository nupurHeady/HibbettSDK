//
//  DeepLinkHandler.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// Deep link handler protocol.
public protocol DeepLinkHandler {

    /// Call when the delegate wants to open a resource specified by a URL,
    /// and provides a dictionary of launch options.
    ///
    /// - Parameters:
    ///   - app: The singleton app object.
    ///   - url: The URL resource to open.
    ///   - options: A dictionary of URL handling options.
    /// For information about the possible keys in this dictionary and how to handle them,
    /// see UIApplicationOpenURLOptionsKey. By default, the value of this parameter is an empty dictionary.
    ///
    /// - Returns: true if the delegate successfully handled the request
    /// or false if the attempt to open the URL resource failed.
    func application(app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
    
    /// Attempts to open provided link, whether deep link or web link.
    ///
    /// - Parameter link: The link to be opened.
    /// - Returns: True if opened, false otherwise.
    @discardableResult
    func open(link: String) -> Bool
    
    /// Attempts to open provided link, whether deep link or web link.
    ///
    /// - Parameter link: The link to be opened.
    /// - Returns: True if opened, false otherwise.
    @discardableResult
    func open(link: String, navigationType: NavigationType, onTab: Int?) -> Bool

}
