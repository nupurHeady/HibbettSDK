//
//  Review.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 12/13/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Product reivew.
public protocol Review {
    
    /// Title.
    var title: String? { get }
    
    /// Review.
    var reviewText: String? { get }
    
    /// User name.
    var userNickname: String? { get }
    
    /// User location.
    var userLocation: String? { get }
    
    /// The external source for the review, if any.
    var externalSource: String? { get }
    
    /// Submission time.
    var submissionTime: Date? { get }
    
    /// Rating out of 5.
    var rating: Int32 { get }
    
}
