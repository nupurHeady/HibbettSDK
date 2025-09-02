//
//  UIView+ActivityIndicating.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIView: @preconcurrency ActivityIndicating {

    /// Shows activity indicator in view given a indicator color.
    ///
    /// - Parameters:
    ///   - color: Indicator color.
    public func showActivityIndicator(color: UIColor) {
        let indicator = activityIndicator()

        indicator.color = color
        indicator.translatesAutoresizingMaskIntoConstraints = false

        addSubview(indicator)
        bringSubviewToFront(indicator)

        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        indicator.startAnimating()
    }
    
    /// Show activity indicator with status
    /// - Parameter status: status message to display while loading
    public func showActivityIndicatorWithStatus(_ status: String? = nil) {
        let defaultStatus = NSLocalizedString("ACTIVITY_LOADING", comment: "Default loading text")
        SVProgressHUD.show(withStatus: status ?? defaultStatus)
    }
    
    /// Show activity indicator with status
    /// - Parameter status: status message to display while loading
    public func showActivityIndicatorWithError(_ error: String? = nil) {
        let defaultError = NSLocalizedString("ERROR_GENERIC_API_REQUEST", comment: "Default error text")
        SVProgressHUD.showError(withStatus: error ?? defaultError)
    }

    public func hideActivityIndicator() {
        SVProgressHUD.dismiss()
        for view in subviews {
            if let view = view as? UIActivityIndicatorView {
                view.stopAnimating()
                view.removeFromSuperview()
            }
        }
    }

}
