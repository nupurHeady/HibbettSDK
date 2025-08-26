//
//  RaffleDateComparator.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Raffle date comparator used to compare product launch or entry dates with the current date on the device.
public final class RaffleDateComparator {

    // MARK: - Init/Deinit

    /// Initializes the launch date comparator.
    public init() { }

    /// Indicates if the given launch date passed the given date.
    ///
    /// - Parameters:
    ///   - launchDate: The launch date to use.
    ///   - date: The date to compare with.
    /// - Returns: `true` if the launch date passed the give date. `false` if not.
    public func hasLaunchDate(_ launchDate: Date, passed date: Date) -> Bool {
        let comparisonResult = launchDate.compare(date)

        switch comparisonResult {
        case .orderedAscending:
            return true
        default:
            return false
        }
    }

    /// Indicates if the given launch date is in the same day as the given date.
    ///
    /// - Parameters:
    ///   - launchDate: The launch date to use.
    ///   - date: The date to compare with.
    /// - Returns: `true` if the launch date is in the same day as the given date. `false` if not.
    public func isLaunchDate(_ launchDate: Date, inSameDayAs date: Date) -> Bool {
        let calendar = NSCalendar.current
        return calendar.isDate(launchDate, inSameDayAs: date)
    }

    /// Indicates if the given launch date is in less than 24h from the given date.
    ///
    /// - Parameters:
    ///   - launchDate: The launch date to use.
    ///   - date: The date to compare with.
    /// - Returns: `true` if the launch date is in less than 24h from the given date. `false` if not.
    public func isLaunchDate(_ launchDate: Date, inLessThanTwentyFourHoursFrom date: Date) -> Bool {
        let hoursBetweenDates = Int(hoursDifferenceBetween(date1: launchDate, andDate2: date))

        return hoursBetweenDates <= 24 && hoursBetweenDates >= 0
    }

    /// Indicates if the given launch date is in the last 24h range past the given date.
    ///
    /// - Parameters:
    ///   - launchDate: The launch date to use.
    ///   - date: The date to compare with.
    /// - Returns: `true` if the launch date is in the 24h range past the given date. `false` if not.
    public func wasLaunchDate(_ launchDate: Date, inThePastTwentyFourHoursFrom date: Date) -> Bool {
        return isLaunchDate(date, inLessThanTwentyFourHoursFrom: launchDate)
    }

    /// Returns the hour difference between the 2 given dates.
    ///
    /// - Parameters:
    ///   - date1: The first date to compare.
    ///   - date2: The second date to compare.
    /// - Returns: The amount of hours between the 2 dates. The value will be negative if date1 is earlier than date2.
    public func hoursDifferenceBetween(date1: Date, andDate2 date2: Date) -> TimeInterval {
        let distanceBetweenDates = date1.timeIntervalSince(date2)
        let secondsInAnHour: TimeInterval = 3600
        let hoursBetweenDates = distanceBetweenDates / secondsInAnHour

        return hoursBetweenDates
    }

    /// Helper function to tell if the given entry date is in less than 24 hours.
    ///
    /// - Parameters:
    ///   - entryDate: The entry date to use.
    ///   - today: Today's date. Default value is `Date()`.
    /// - Returns: `true` if the entry date is in less than 24 hours. `false` if not.
    public func isEntryDateToday(entryDate: Date, today: Date = Date()) -> Bool {
        return isLaunchDate(entryDate, inLessThanTwentyFourHoursFrom: today)
    }

    /// Helper function to tell if the entry opening date passed, but not the entry closing date.
    ///
    /// - Parameters:
    ///   - entryOpeningDate: The entry opening date to use.
    ///   - entryClosingDate: The entry closing date to use.
    ///   - today: Today's date. Default value is `Date()`.
    /// - Returns: `true` if the entry opening date passed but not the entry closing date. `false` if not.
    public func hasEntryOpeningDatePassed(entryOpeningDate: Date,
                                          andEntryClosingDateHasNot entryClosingDate: Date,
                                          today: Date = Date()) -> Bool {
        return hasLaunchDate(entryOpeningDate, passed: today) && !hasLaunchDate(entryClosingDate, passed: today)
    }

    /// Whether the Raffle is currently prior to opening.
    ///
    /// - Parameters:
    ///   - openDate: The entry opening date to use.
    ///   - now: Now.
    /// - Returns: True if Raffle is prior to open, false othwerise.
    public func isPriorToRaffleOpen(openDate: Date, now: Date = Date()) -> Bool {
        return now < openDate
    }

    /// Whether the Raffle is currently open given open/close dates.
    ///
    /// - Parameters:
    ///   - openDate: Date Raffle opens.
    ///   - closeDate: Date Raffle closes.
    ///   - now: Now.
    /// - Returns: True if Raffle is currently open, false otherhwise.
    public func isRaffleOpen(openDate: Date, closeDate: Date, now: Date = Date()) -> Bool {
        return now >= openDate && now < closeDate
    }

    /// Whether the Raffle is currently closed given the close date.
    ///
    /// - Parameters:
    ///   - closeDate: Date Raffle closes.
    ///   - resultsAnnouncedDate: Date Raffle Results announced.
    ///   - now: Now.
    /// - Returns: True if Raffle is currently closed, false otherwise.
    public func isRaffleClosed(closeDate: Date, resultsAnnouncedDate: Date, now: Date = Date()) -> Bool {
        return now >= closeDate && now < resultsAnnouncedDate
    }

    /// Whether the Raffle is currently past Result Announced state.
    ///
    /// - Parameters:
    ///   - resultsAnnouncedDate: Date Results announced.
    ///   - now: Now.
    /// - Returns: True if Results have been announced, false otherwise.
    public func haveResultsBeenAnnounced(resultsAnnouncedDate: Date, now: Date = Date()) -> Bool {
        return now >= resultsAnnouncedDate
    }

}
