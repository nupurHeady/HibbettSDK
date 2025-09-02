//
//  UIView+Layout.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    /// Snaps the given view with the current view on each side (top, bottom, leading, trailing).
    ///
    /// - Parameter view: The view to snap to.
    /// - Parameter withSafeAreaTop: If true, top anchor is considered from safeAreaLayoutGuide
    /// - Parameter withSafeAreaBottom: If true, bottom anchor is considered from safeAreaLayoutGuide
    func snap(to view: UIView, withSafeAreaTop: Bool = false, withSafeAreaBottom: Bool = false) {
        let topAnchorLayout = withSafeAreaTop ? safeAreaLayoutGuide.topAnchor : topAnchor
        let bottomAnchorLayout = withSafeAreaBottom ? safeAreaLayoutGuide.bottomAnchor : bottomAnchor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchorLayout).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchorLayout).isActive = true
    }
    
    /// Snaps the given view with the current view on each side (top, bottom, leading, trailing).
    ///
    /// - Parameter view: The view to snap to.
    /// - Parameter safeAreaLayoutGuide: Safe area layout guide.
    @available(iOS 11, *)
    func snap(to view: UIView, safeAreaLayoutGuide: UILayoutGuide) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    /// Adds a gradient from left to right.
    ///
    /// - Parameters:
    ///   - left: Left color.
    ///   - right: Right color.
    func addGradient(left: UIColor, right: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [left.cgColor, right.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    /// Adds a gradient from top to bottom.
    ///
    /// - Parameters:
    ///   - top: Top color.
    ///   - bottom: Bottom color.
    func addGradients(top: UIColor, bottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [top.cgColor, bottom.cgColor]
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// Adds a gradient
    ///
    /// - Parameters:
    ///   - colors: All the colors to be used
    ///   - direction: The direction to be applied in
    func addGradient(colors: [CGColor], direction: LinearGradientLayer.Direction) {
        let gradientLayer = LinearGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = self.bounds
        gradientLayer.direction = direction
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// Removes shadow.
    func removeShadow() {
        layer.shadowOpacity = 0.0
    }
    
    /// Create a copy of a view
    /// - Returns: Copy of a view
    func copyView<T: UIView>() throws -> T? {
        let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
    }
}
