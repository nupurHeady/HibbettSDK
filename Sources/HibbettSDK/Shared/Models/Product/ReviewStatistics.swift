//
//  ReviewStatistics.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 12/13/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// The statistics about the reviews for a product.
public protocol ReviewStatistics {
    
    /// The overall rating for the product.
    var overallRating: Double { get }
    
    /// The total number of reviews for the product.
    var numberOfReviews: Int { get }
    
}
