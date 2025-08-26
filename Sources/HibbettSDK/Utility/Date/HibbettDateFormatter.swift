//
//  HibbettDateFormatter.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 10/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Date formatter encapsulating date format for all Hibbett entities.
public final class HibbettDateFormatter: DateFormatter {
    
    // MARK: - Class properties
    
    /// Singleton instance.
    public static var shared: HibbettDateFormatter { HibbettDateFormatter() }
    
    /// Default date format for all entities.
    public static let defaultFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
    
    // MARK: - Init/Deinit
    
    override public init() {
        super.init()
        
        dateFormat = HibbettDateFormatter.defaultFormat
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance functions
    
    /// Date string for provided date and format.
    ///
    /// - Parameters:
    ///   - date: Date.
    ///   - dateFormat: Format.
    /// - Returns: Date string.
    public func formatDate(date: Date, usingFormat dateFormat: String) -> String {
        self.dateFormat = dateFormat
        
        let formattedDate = string(from: date)
        resetDateFormat()
        return formattedDate
    }
    
    /// Swap timezone from `dateString` param with date from `dateFormat` param
    ///
    /// For eg:
    ///
    /// Date string is `2021-07-29T10:00:00-04:00` and date format is `yyyy-MM-dd'T'HH:mm:ssXXX`
    ///
    /// So this will get the timezone from `dateString` which is `10:00:00-04:00` and
    /// date from `dateFormat` which is `yyyy-MM-dd`
    ///
    /// It will swap them and return an iso date formatted string like `yyyy-MM-ddT10:00:00-04:00`
    ///
    /// This is useful if you forcefully want to use timezone with a set time from the date string and
    /// convert any date according to this new swapped date formar
    /// 
    /// - Parameters:
    ///   - dateString: Date string from which you need to get the timezone part
    ///   - dateFormat: Date format from which you need the date part
    /// - Returns: iso date format with timezone from dateString and date from dateFormat
    public func swapTimeZoneFrom(dateString: String, with dateFormat: String = defaultFormat) -> String? {
        let dateStringSplit = dateString.split(separator: "T", maxSplits: 1)
        let dateFormatSplit = dateFormat.split(separator: "T", maxSplits: 1)
        
        if dateStringSplit.count == 2 && dateFormatSplit.count == 2,
           let timezone = dateStringSplit.last,
           let dateFormat = dateFormatSplit.first {
            return "\(dateFormat)T\(timezone)"
        }
        return nil
    }
    
    /// Resets date format to default Hibbett value.
    public func resetDateFormat() {
        dateFormat = HibbettDateFormatter.defaultFormat
    }
    
}
