//
//  RaffleDateComparatorTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

@testable import HibbettSDK
import PCFSwift
import XCTest

final class RaffleDateComparatorTests: XCTestCase {
    var comparator: RaffleDateComparator!
    let dateFormatter = HibbettDateFormatter.shared

    override func setUp() {
        super.setUp()

        comparator = RaffleDateComparator()
    }

    override func tearDown() {
        comparator = nil

        super.tearDown()
    }

    // MARK: - Launch date passed tests

    func testLaunchDatePassed_whenProductLaunched() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-14T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDatePassed_whenProductDidNotLaunchYet() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-12T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDatePassed_whenProductDidNotLaunchYet_sameDay_differentHour() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDatePassed_whenProductIsLaunchingToday() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T08:30:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    // MARK: - Launch date same day tests

    func testLaunchDateToday_whenLaunchDateIsToday() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.isLaunchDate(launchDate, inSameDayAs: currentDate))
    }

    func testLaunchDateToday_whenLaunchDateIsNotToday() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-14T16:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.isLaunchDate(launchDate, inSameDayAs: currentDate))
    }

    // MARK: - Launch date in less than 24h tests

    func testLaunchDateTwentyFourHours_whenLaunchDateIsInLessThanTwentyFourHours() {
        // Given
        let launchDateString = "2017-04-14T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.isLaunchDate(launchDate, inLessThanTwentyFourHoursFrom: currentDate))
    }

    func testLaunchDateTwentyFourHours_whenLaunchDateIsNotInLessThanTwentyFourHours() {
        // Given
        let launchDateString = "2017-04-14T16:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.isLaunchDate(launchDate, inLessThanTwentyFourHoursFrom: currentDate))
    }

    // MARK: - Launch date happened in the last 24h range tests

    func testLaunchDateHappened_inTheLastTwentyFourHours() {
        // Given
        let launchDateString = "2017-04-14T16:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-15T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.wasLaunchDate(launchDate, inThePastTwentyFourHoursFrom: currentDate))
    }

    func testLaunchDateHappened_beforeTheLastTwentyFourHours() {
        // Given
        let launchDateString = "2017-04-14T13:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-15T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.wasLaunchDate(launchDate, inThePastTwentyFourHoursFrom: currentDate))
    }

    func testLaunchDateHasNotHappenedYet_whenCheckingLastTwentyFourHours() {
        // Given
        let launchDateString = "2017-04-17T13:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-15T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.wasLaunchDate(launchDate, inThePastTwentyFourHoursFrom: currentDate))
    }

    // MARK: - Launch date with custom timezone for current date

    func testLaunchDatePassed_whenProductLaunched_withCustomTimezone() {
        // Given
        let launchDateString = "2017-04-13T14:54:32-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-06-15T14:54:32-0400"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDatePassed_whenProductDidNotLaunchYet_sameDay_differentHour_withCustomTimezone() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDatePassed_whenProductIsLaunchingToday_withCustomTimezone() {
        // Given
        let launchDateString = "2017-06-15T14:54:32-0400"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasLaunchDate(launchDate, passed: currentDate))
    }

    func testLaunchDateToday_whenLaunchDateIsToday_withCustomTimezone() {
        // Given
        let launchDateString = "2017-04-13T14:54:32-0400"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.isLaunchDate(launchDate, inSameDayAs: currentDate))
    }

    func testLaunchDateToday_whenLaunchDateIsNotToday_withCustomTimezone() {
        // Given
        let launchDateString = "2017-05-13T14:54:32-0400"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.isLaunchDate(launchDate, inSameDayAs: currentDate))
    }

    func testLaunchDateTwentyFourHours_whenLaunchDateIsInLessThanTwentyFourHours_withCustomTimezone() {
        // Given
        let launchDateString = "2017-06-15T20:54:32-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-06-15T14:59:59-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.isLaunchDate(launchDate, inLessThanTwentyFourHoursFrom: currentDate))
    }

    func testLaunchDateTwentyFourHours_whenLaunchDateIsNotInLessThanTwentyFourHours_withCustomTimezone() {
        // Given
        let launchDateString = "2017-06-15T14:54:32-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-06-15T20:54:30-0400"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.isLaunchDate(launchDate, inLessThanTwentyFourHoursFrom: currentDate))
    }

    func testHoursDifference_whenFirstDateIsLaterThanSecondDate() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T12:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!
        let hoursDifference = comparator.hoursDifferenceBetween(date1: launchDate, andDate2: currentDate)

        // When
        let expectedTimeDifference: TimeInterval = 3.0

        // Then
        XCTAssertEqual(hoursDifference, expectedTimeDifference)
    }

    func testHoursDifference_whenHoursAreEqual() {
        // Given
        let launchDateString = "2017-04-13T15:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!
        let hoursDifference = comparator.hoursDifferenceBetween(date1: launchDate, andDate2: currentDate)

        // When
        let expectedTimeDifference: TimeInterval = 0.0

        // Then
        XCTAssertEqual(hoursDifference, expectedTimeDifference)
    }

    func testHoursDifference_whenFirstDateIsEarlierThanSecondDate() {
        // Given
        let launchDateString = "2017-04-13T12:00:00-04:00"
        let launchDate = dateFormatter.date(from: launchDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!
        let hoursDifference = comparator.hoursDifferenceBetween(date1: launchDate, andDate2: currentDate)

        // When
        let expectedTimeDifference: TimeInterval = -3.0

        // Then
        XCTAssertEqual(hoursDifference, expectedTimeDifference)
    }

    // MARK: - Entry date tests

    func testEntryDatePassedButNotLaunchDate() {
        // Given
        let entryOpeningDateString = "2017-04-13T12:00:00-04:00"
        let entryOpeningDate = dateFormatter.date(from: entryOpeningDateString)!
        let entryClosingDateString = "2017-04-14T12:00:00-04:00"
        let entryClosingDate = dateFormatter.date(from: entryClosingDateString)!
        let currentDateString = "2017-04-13T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertTrue(comparator.hasEntryOpeningDatePassed(entryOpeningDate: entryOpeningDate,
                                                           andEntryClosingDateHasNot: entryClosingDate,
                                                           today: currentDate))
    }

    func testEntryDateAndLaunchDatePassed() {
        // Given
        let entryOpeningDateString = "2017-04-13T12:00:00-04:00"
        let entryOpeningDate = dateFormatter.date(from: entryOpeningDateString)!
        let entryClosingDateString = "2017-04-14T12:00:00-04:00"
        let entryClosingDate = dateFormatter.date(from: entryClosingDateString)!
        let currentDateString = "2017-04-15T15:00:00-04:00"
        let currentDate = dateFormatter.date(from: currentDateString)!

        // Then
        XCTAssertFalse(comparator.hasEntryOpeningDatePassed(entryOpeningDate: entryOpeningDate,
                                                            andEntryClosingDateHasNot: entryClosingDate,
                                                            today: currentDate))
    }
}
