//
//  UIScrollView+Scroll.swift
//  HibbettSDK
//
//  Created by Thibault Klein on 5/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Indicates the current scroll direction
///
/// - up: Scrolling is going up.
/// - down: Scrolling is going down.
public enum ScrollDirection {
    case up, down
}

public extension UIScrollView {

    /// Indicates the current scroll direction.
    ///
    /// - Parameter oldContentOffset: The old content offset that was recorded before the content offset changed.
    ///
    /// - Note: Should always be called in `scrollViewDidScroll(_ scrollView: UIScrollView)` function.
    ///
    /// - Returns: The scroll direction.
    func scrollingDirection(forPreviouslyRecordedContentOffset oldContentOffset: CGPoint) -> ScrollDirection {
        if oldContentOffset.y > contentOffset.y {
            return .up
        } else {
            return .down
        }
    }

    /// Scrolls the scroll view to the top.
    ///
    /// - Parameter animated: `true` to animate the scroll. `false` to not animate.
    func scrollToTop(animated: Bool = true) {
        let contentOffset = CGPoint(x: 0.0, y: -contentInset.top)
        setContentOffset(contentOffset, animated: animated)
    }

    /// Scrolls to the given offset.
    ///
    /// - Parameters:
    ///   - offset: The offset to scroll to. If `nil`, the scroll view will be scrolled to the top.
    ///   - animated: `true` to animate the scroll. `false` to not animate.
    func scrollToOffset(offset: CGPoint?, animated: Bool = true) {
        guard let offset = offset else {
            scrollToTop(animated: animated)
            return
        }

        setContentOffset(offset, animated: animated)
    }

    /// Indicates if the scroll view is bouncing at the top of the view.
    ///
    /// - Returns: `true` if the scroll view is bouncing at the top. `false` if not.
    func isBouncingAtTheTop() -> Bool {
        if #available(iOS 11.0, *) {
            return contentOffset.y < -adjustedContentInset.top
        } else {
            return contentOffset.y < -contentInset.top
        }
    }

}
