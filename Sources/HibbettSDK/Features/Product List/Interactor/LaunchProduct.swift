//
//  LaunchProduct.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//
import Foundation
import PCFSwift
import CoreFeature
import UIKit

/// Launch product model.
public struct LaunchProduct: CoreFeature.Product {
    
    public typealias SkuType = PCFSku
    public typealias PersonalizationOptionType = PCFPersonalizationOption
    public typealias UserReviewType = PCFUserReview
    public typealias ColorType = PCFColor
    public typealias ImageResourceType = PCFImageResource

    /// Identifier of product.
    public let resourceId: String

    /// Name of product.
    public let name: String

    /// Full price of the product.
    public let price: Float

    /// Sale price of the product.
    public let discountedPrice: Float?

    /// Product's description. Potentially contains HTML tags.
    public let productDescription: String
    
    /// Product badge (e.g. Extended Sizing, Past Season, etc.).
    public let badge: String?

    /// A dictionary of all available images for that product.
    /// Each key represents an ID, and the corresponding value is a
    /// collection of `Image` objects.Should contain images to be displayed
    /// in the main carousel, product variations images.
    public let imageResources: [String: [ImageResourceType]]?

    /// Collection of image ids to be displayed in the main carousel.
    /// Those IDs should be ordered in the way they are expected to be presented
    /// to the user and present in `imageResources`. Typically for a PDP the
    /// first image in the array will show up first.
    public let imageIds: [String]

    /// Collection of wishlist ids.
    public let wishlistIds: [String]?

    /// The product associated gender.
    public let gender: String?

    /// The product brand.
    public let brand: String?

    /// The product launch date in string format.
    public let launchDate: Date?
    
    /// The date Raffle opens.
    public let openDate: Date?
    
    /// The date Raffle closes.
    public let closeDate: Date?
    
    /// Date formatter.
    nonisolated(unsafe) public static var dateFormatter: DateFormatter = HibbettDateFormatter.shared

    public let categoryIds: [String]? = nil

    public let skus: [SkuType]? = nil

    public let personalizationOptions: [PersonalizationOptionType]? = nil

    public let userReviews: UserReviewType? = nil

    public let userImageIds: [String]? = nil

    public let tags: [String]? = nil
    
    /// Badge details
    public let productBadge: ProductBadge?
    
    /// Content
    public let content: ProductContent?
    
    /// Apparel raffle type. Could be either "shoe" or "apparel".
    public let apparelRaffleType: String?
    
    /// Type of Raffle - Delivery, InStore or Combo
    public let raffleType: String?
}

// MARK: - Protocol conformance

// MARK: Swift.Decodable

extension LaunchProduct: Swift.Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case description
        case imageIds
        case launchDate
        case openDate
        case closeDate
        case imageResources
        case discountedPrice
        case wishlistIds
        case gender
        case brand
        case productLabel
        case badge
        case content
        case raffleType
        case apparelRaffleType = "type"
    }
    
    public init(from decoder: Swift.Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let id = try values.decode(String.self, forKey: .id)
        let name = try values.decode(String.self, forKey: .name)
        let description = try values.decode(String.self, forKey: .description)
        let imageIds = try values.decode([String].self, forKey: .imageIds)
        let imageResources = try values.decodeIfPresent([String : [ImageResourceType]].self,
                                                        forKey: .imageResources)
        let discountedPrice = try? values.decode(Float.self, forKey: .discountedPrice)
        let wishlistIds = try? values.decode([String].self, forKey: .wishlistIds)
        let gender = try? values.decode(String.self, forKey: .gender)
        let brand = try? values.decode(String.self, forKey: .brand)
        let productLabel = try? values.decode(String.self, forKey: .productLabel)
        
        // TODO: remove once API is fixed for the product prices
        // https://www.pivotaltracker.com/story/show/148704857
        let price: Float = (try? values.decode(Float.self, forKey: .price)) ?? 0
        
        let launchDate: Date?
        if let launchDateString = try? values.decode(String.self, forKey: .launchDate) {
            launchDate = LaunchProduct.dateFormatter.date(from: launchDateString)
        } else {
            launchDate = nil
        }
        
        let openDate: Date?
        if let openDateString = try? values.decode(String.self, forKey: .openDate) {
            openDate = LaunchProduct.dateFormatter.date(from: openDateString)
        } else {
            openDate = nil
        }
        
        let closeDate: Date?
        if let closeDateString = try? values.decode(String.self, forKey: .closeDate) {
            closeDate = LaunchProduct.dateFormatter.date(from: closeDateString)
        } else {
            closeDate = nil
        }
        
        let productBadge =  try values.decodeIfPresent(ProductBadge.self, forKey: .badge)
        
        let content =  try values.decodeIfPresent(ProductContent.self, forKey: .content)
        
        let apparelRaffleType = try? values.decode(String.self, forKey: .apparelRaffleType)
        
        let raffleType =  try? values.decodeIfPresent(String.self, forKey: .raffleType)
        
        self.init(resourceId: id, name: name, price: price, discountedPrice: discountedPrice,
                  productDescription: description, badge: productLabel, imageResources: imageResources ?? [:],
                  imageIds: imageIds, wishlistIds: wishlistIds, gender: gender, brand: brand, launchDate: launchDate,
                  openDate: openDate, closeDate: closeDate, productBadge: productBadge,content: content, 
                  apparelRaffleType: apparelRaffleType, raffleType: raffleType)
    }

}
