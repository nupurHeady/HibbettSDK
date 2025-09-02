//
//  ActivityIndicating.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// Describes an element that can show an activity indicator.
public protocol ActivityIndicating {

    /// View to use while indiating activity.
    ///
    /// - Returns: Activity indicator view.
    func activityIndicator() -> UIActivityIndicatorView

    /// Shows activity indicator.
    func showActivityIndicator(color: UIColor)

    /// Hides activity indicator.
    func hideActivityIndicator()

}

extension ActivityIndicating {

    @MainActor public func activityIndicator() -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

}
