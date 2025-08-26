//
//  UIView+Keyboard.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UIView {

    /// Dismisses keyboard if present.
    func dismissKeyboard() {
        endEditing(true)
    }

}
