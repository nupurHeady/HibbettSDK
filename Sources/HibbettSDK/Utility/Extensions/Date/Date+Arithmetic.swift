//
//  Date+Arithmetic.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/11/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Helpers for doing arithmetic operations with Dates.
public extension Date {

    /// Number of seconds in a day.
    ///
    /// - Returns: Number of seconds in a day.
    static func secondsInDay() -> TimeInterval {
        return 60 * 60 * 24
    }

    /// Whether the current date's has passed in context of its day.
    /// For example, if today is June 15, then June 14 is earlier
    /// but June 16 is not.
    ///
    /// - Returns: True if the date has passed, false otherwise.
    func dayHasPassed() -> Bool {
        let today = Date()

        switch self.isSameDay(as: today) {
        case true:
            return false
        case false:
            return self < today
        }
    }

    /// Whether the current date is today.
    ///
    /// - Parameter calendar: Calendar to use.
    /// - Returns: True if is today, false otherwise.
    func isToday(calendar: Calendar = Calendar.current) -> Bool {
        let today = Date()

        return self.isSameDay(as: today, calendar: calendar)
    }

    /// Whether the current date is in the same day as one provided.
    ///
    /// - Parameters:
    ///   - other: Date to compare to.
    ///   - calendar: Calendar to use.
    /// - Returns: True if the same day, false otherwise.
    func isSameDay(as other: Date, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.isDate(self, inSameDayAs: other)
    }

    /// Creates new date by adding provided number of minutes to the current date.
    ///
    /// - Parameters:
    ///   - numMinutes: Number of minutes to add.
    ///   - calendar: Calendar to use.
    /// - Returns: New date.
    func addMinutes(_ numMinutes: Int, calendar: Calendar = Calendar.current) -> Date? {
        return calendar.date(byAdding: .minute, value: numMinutes, to: self)
    }

    /// Creates new date by subtracting provided number of minutes from the current date.
    ///
    /// - Parameters:
    ///   - numMinutes: Number of minutes to subtract.
    ///   - calendar: Calendar to use.
    /// - Returns: New date.
    func minusMinutes(_ numMinutes: Int, calendar: Calendar = Calendar.current) -> Date? {
        return addMinutes(numMinutes * -1, calendar: calendar)
    }

    /// Creates new date by adding provided number od dates to the current date.
    ///
    /// - Parameters:
    ///   - numDays: Number of days to add.
    ///   - calendar: Calendar to use.
    /// - Returns: New date.
    func addDays(_ numDays: Int, calendar: Calendar = Calendar.current) -> Date? {
        return calendar.date(byAdding: .day, value: numDays, to: self)
    }

    /// Creates new date by subtracting provided number of days from the current date.
    ///
    /// - Parameters:
    ///   - numDays: Number of days to subtract.
    ///   - calendar: Calendar to use.
    /// - Returns: New date.
    func minusDays(_ numDays: Int, calendar: Calendar = Calendar.current) -> Date? {
        return addDays(numDays * -1, calendar: calendar)
    }
    
    /// Creates new date by adding provided number of hours from current date.
    ///
    /// - Parameters:
    ///   - numHours: Number of hours to add.
    ///   - calendar: Calendar to use.
    /// - Returns: New date.
    func addHours(_ numHours: Int, calendar: Calendar = Calendar.current) -> Date? {
        return calendar.date(byAdding: .hour, value: numHours, to: self)
    }

    /// Creates new date by replacing the hour value of current date.
    ///
    /// - Parameters:
    ///   - newHour: New hour to use.
    ///   - calendarType: Calendary type. Defaults to Gregorian.
    /// - Returns: New date.
    func replaceHour(with newHour: Int, calendarType: Calendar.Identifier = .gregorian) -> Date? {
        let calendar = Calendar(identifier: calendarType)
        var components = calendar.dateComponents([.year,
                                                  .month,
                                                  .day,
                                                  .hour,
                                                  .minute,
                                                  .second],
                                                 from: self)

        components.hour = newHour

        return calendar.date(from: components)
    }

    /// The amount of months passed from a specific source date.
    ///
    /// - Parameter date: The source date.
    /// - Returns: The amount of months passed since the source date.
    func months(since date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date, to: Date())
        return components.month
    }
    
    /// The amount of months passed from a specific source date string.
    ///
    /// - Parameter dateString: The source date string.
    /// - Returns: The amount of months passed since the source date.
    func months(since dateString: String) -> Int? {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let releaseDate = dateformatter.date(from: dateString) else {
            return nil
        }
        
        return months(since: releaseDate)
    }
    
    /// The amount of days passed from a specific source date.
    ///
    /// - Parameter date: The source date.
    /// - Returns: The amount of days passed since the source date.
    func days(since date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date, to: Date())
        return components.day
    }
    
    /// The amount of days passed from a specific source date string.
    ///
    /// - Parameter dateString: The source date string.
    /// - Returns: The amount of days passed since the source date.
    func days(since dateString: String) -> Int? {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let releaseDate = dateformatter.date(from: dateString) else {
            return nil
        }
        
        return days(since: releaseDate)
    }
    
    /// The amount of hours passed from a specific source date.
    ///
    /// - Parameter date: The source date.
    /// - Returns: The amount of hours passed since the source date.
    func hours(since date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: date, to: Date())
        return components.hour
    }
    
    /// The amount of hours passed from a specific source date string.
    ///
    /// - Parameter dateString: The source date string.
    /// - Returns: The amount of hours passed since the source date.
    func hours(since dateString: String) -> Int? {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let releaseDate = dateformatter.date(from: dateString) else {
            return nil
        }
        
        return hours(since: releaseDate)
    }
    
    /// The amount of minutes passed from a specific source date.
    ///
    /// - Parameter date: The source date.
    /// - Returns: The amount of minutes passed since the source date.
    func minutes(since date: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: date, to: Date())
        return components.minute
    }
    
    /// The amount of minutes passed from a specific source date string.
    ///
    /// - Parameter dateString: The source date string.
    /// - Returns: The amount of minutes passed since the source date.
    func minutes(since dateString: String) -> Int? {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let releaseDate = dateformatter.date(from: dateString) else {
            return nil
        }
        
        return minutes(since: releaseDate)
    }
}
