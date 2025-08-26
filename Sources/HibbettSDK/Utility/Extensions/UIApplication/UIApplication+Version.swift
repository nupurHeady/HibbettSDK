//
//  UIApplication+Version.swift
//  Hibbett
//
//  Created by Dominic Ancrum on 10/17/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIApplication {
    
    /// /// Retrieve the current version of the app.
    ///
    /// - Returns: The current version of the app.
    public func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    /// Retrieve the current build of the app.
    ///
    /// - Returns: The current build of the app.
    public func appBuild() -> String {
        if let bundleVersionKey = kCFBundleVersionKey as String?,
            let appBuild = Bundle.main.object(forInfoDictionaryKey: bundleVersionKey) as? String {
            return appBuild
        } else {
            return ""
        }
    }
    
}
