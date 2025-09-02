//
//  UIApplication+Layout.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UIApplication {

    /// Returns the status bar height.
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    /// Checks if view hierarchy of application contains `UIRemoteKeyboardWindow` if it does, keyboard is presented
    var isKeyboardPresented: Bool {
        if let keyboardWindowClass = NSClassFromString("UIRemoteKeyboardWindow"),
            self.windows.contains(where: { $0.isKind(of: keyboardWindowClass) }) {
            return true
        } else {
            return false
        }
    }

    /// Top-most window of the application.
    ///
    /// - Returns: Top-most window. Nil if no windows.
    func topMostWindow() -> UIWindow? {
        return windows.first
    }
}
