//
//  HibbettStoreDateFormatter.swift
//  HibbettSDK
//
//  Created by Kamal Wadhwa on 13/06/24.
//  Copyright © 2024 Heady LLC. All rights reserved.
//

import Foundation

public typealias TimeZoneIdentifierString = String

// MARK: - HibbettStoreDateFormatter

/// Date formatter encapsulating date format for all Store timings.
public final class HibbettStoreDateFormatter: DateFormatter, @unchecked Sendable {
    // MARK: - Class properties

    /// Singleton instance.
    public static var shared: HibbettStoreDateFormatter { HibbettStoreDateFormatter() }

    /// Convert store time from one timezone to another
    public func convertTime(_ time: String, from sourceTimeZoneIdentifier: HibbettStoreTimeZones, to destinationTimeZone: TimeZone = .current) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mma"
        dateFormatter.timeZone = TimeZone(identifier: sourceTimeZoneIdentifier.timezone)

        guard let date = dateFormatter.date(from: time) else {
            return nil
        }

        dateFormatter.timeZone = destinationTimeZone
        return dateFormatter.string(from: date)
    }

    /// Helper function to format time correctly
    public func formatTime(_ time: String) -> String {
        let trimmedTime = time.trimmingCharacters(in: .whitespaces)
        let period = trimmedTime.suffix(2).uppercased()
        var timeWithoutPeriod = trimmedTime.dropLast(2)

        if !timeWithoutPeriod.contains(":") {
            timeWithoutPeriod.append(contentsOf: ":00")
        }

        return timeWithoutPeriod + period
    }

    /// Helper function to get days range
    public func getDaysRange(from startDay: String, to endDay: String) -> [String] {
        let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        if let startIndex = daysOfWeek.firstIndex(of: startDay), let endIndex = daysOfWeek.firstIndex(of: endDay) {
            if startIndex <= endIndex {
                return Array(daysOfWeek[startIndex ... endIndex])
            } else {
                return Array(daysOfWeek[startIndex...]) + Array(daysOfWeek[...endIndex])
            }
        }
        return []
    }
}
