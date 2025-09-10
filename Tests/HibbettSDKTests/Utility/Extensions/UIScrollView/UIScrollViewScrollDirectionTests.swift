//
//  UIScrollViewScrollDirectionTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

@MainActor final class UIScrollViewScrollDirectionTests: XCTestCase {

    func testScrollView_whenScrollDirectionIsUp() {
        // Given
        let scrollView = UIScrollView()
        scrollView.contentOffset = CGPoint(x: 0.0, y: 90.0)
        let oldContentOffset = CGPoint(x: 0.0, y: 100.0)
        let scrollDirection = scrollView.scrollingDirection(forPreviouslyRecordedContentOffset: oldContentOffset)

        // When
        let expectedScrollDirection = ScrollDirection.up

        // Then
        XCTAssertEqual(scrollDirection, expectedScrollDirection)
    }

    func testScrollView_whenScrollDirectionIsDown() {
        // Given
        let scrollView = UIScrollView()
        scrollView.contentOffset = CGPoint(x: 0.0, y: 100.0)
        let oldContentOffset = CGPoint(x: 0.0, y: 90.0)
        let scrollDirection = scrollView.scrollingDirection(forPreviouslyRecordedContentOffset: oldContentOffset)

        // When
        let expectedScrollDirection = ScrollDirection.down

        // Then
        XCTAssertEqual(scrollDirection, expectedScrollDirection)
    }

}
