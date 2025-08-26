//
//  UIButton+Layout.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// Clears text, if present.
    public func clearText() {
        titleLabel?.text = nil
    }

    /// Clears image, if present.
    public func clearImage() {
        imageView?.image = nil
    }

    /// Removes title view.
    public func removeTitle() {
        titleLabel?.removeFromSuperview()
    }

    /// Restores title view if removed.
    public func restoreTitle() {
        if let titleLabel = titleLabel {
            addSubview(titleLabel)
        }
    }

    /// Sets the image next to the right of the button title.
    ///
    /// - Parameters:
    ///   - image: Image.
    ///   - titleToImageInset: Space between title and image.
    public func setRightToLeftImage(_ image: UIImage, withInset titleToImageInset: CGFloat) {
        setImage(image, for: .normal)

        semanticContentAttribute = .forceRightToLeft
        imageEdgeInsets.left = titleToImageInset
        titleEdgeInsets.left = -titleToImageInset
    }

    /// Removes the image that is next to the right of the button title.
    public func removeRightToLeftImage() {
        setImage(nil, for: .normal)

        semanticContentAttribute = .unspecified
        imageEdgeInsets.left = 0
        titleEdgeInsets.left = 0
    }

    /// Add spacing between image and text in button
    /// - Parameters:
    /// - spacing: Spacing.
    public func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1

        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount * factor, bottom: 0, right: insetAmount * factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount * factor, bottom: 0, right: -insetAmount * factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }

}
