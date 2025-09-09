//
//  ContentModel.swift
//  Hibbett
//
//  Created by Jigar on 22/09/2021.
//  Copyright © 2021 Heady LLC. All rights reserved.
//

import PCFSwift
import UIKit

/// Launch product content.
public struct ProductContent: Codable {
    
    // MARK: - Types
    
    /// Content position
    ///
    /// - above: Add content above to product
    /// - below: Add content below to product
    public enum PositionType: String,Codable {
        case above = "Above"
        case below = "Below"
    }
    
    /// Content thumbnail type
    ///
    /// - image: Image thumbnail
    /// - video: Video thumbnail
    public enum ThumbnailType: String, Codable {
        case image
        case video
    }
    
    /// Content id
    public var contentId: String
    
    /// Content position
    public var position: PositionType
    
    /// Raffle id
    public var raffleId: String
    
    /// Dimensions
    public var thumbnailDimensions: CustomDimension?
    
    /// Thumbnail type
    public var thumbnailType: ThumbnailType?
    
    /// Thumbnail url for video
    public var thumbnailUrl: [String]?
    
    /// Thumbnail Caption
    public var thumbnailCaption: String?
    
    /// Thumbnail for image / gif
    public var thumbnail: String?
    
}

public struct CustomDimension: Codable {
    
   public let width: CGFloat
    public let height: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case width
        case height
    }
}
