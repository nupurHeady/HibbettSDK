//
//  NavigationBarSegmentedControl.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/28/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/** Custom UISegmentedControl that can fit full width in a navigation bar.
 
 - Note: Because UINavigationItem titleView gets resizes automatically by the system to fit the subview width,
 we need to override the setFrame function of UISegmentedControl and force the system to use the original frame
 instead of letting the system change it to fit the navigation bar title view.
 
 [Stack Overflow]: https://stackoverflow.com/questions/3756395/how-can-i-get-a-full-sized-uinavigationbar-titleview
 [answer]: https://stackoverflow.com/a/46293723
 
 We also need to make some updates to the view's constraints to remove margins on the left and right
 side of the navigation bar title view. See this [Stack Overflow] thread, and particularly this [answer]
 for more information.
*/
public final class NavigationBarSegmentedControl: UISegmentedControl {
    
    private struct Constants {
        static let marginToRemove: CGFloat = 8
    }
    
    override public var frame: CGRect {
        get {
            return super.frame
        }
        set {
            super.frame = newValue.insetBy(dx: -newValue.minX, dy: 0)
        }
    }
    
    override public func didMoveToSuperview() {
        if let superview = superview {
            frame = superview.bounds
            translatesAutoresizingMaskIntoConstraints = true
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        
        superview?.constraints.forEach { constraint in
            if abs(constraint.constant) == Constants.marginToRemove {
                constraint.isActive = false
            }
        }
    }
    
}
