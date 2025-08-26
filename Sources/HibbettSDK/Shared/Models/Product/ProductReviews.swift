//
//  ProductReviews.swift
//  HibbettSDK
//
//  Created by Harlan Kellaway on 12/13/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Reviews data for a Product.
public protocol ProductReviews {
    
    /// Statistics based on combining all Reviews data.
    var statistics: ReviewStatistics? { get }
    
    /// Reviews.
    var reviews: [Review] { get }
    
}
