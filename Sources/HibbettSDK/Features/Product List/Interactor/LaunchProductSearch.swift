//
//  LaunchProductSearch.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/5/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import PCFSwift
import CoreFeature
import UIKit

/// Launch product search result.
public struct LaunchProductSearch: ProductSearch {
    
    public typealias FilterType = PCFFilter
    public typealias ProductType = LaunchProduct
    public typealias SortOptionType = PCFSortOption

    /// A list of ShortProduct given one or many categories and a list of filters.
    public var products: [ProductType]

    /// Total number of results for the search query.
    public let totalResults: Int

    /// An array of Filter to be used with the search endpoint.
    public let filters: [FilterType]

    /// An array of SortOption to be used with the search endpoint.
    public let sortOptions: [SortOptionType]
    
    private let raffleDateComparator = RaffleDateComparator()
    
    // MARK: - Init/Deinit
    
    public init(products: [ProductType],
                totalResults: Int,
                filters: [FilterType],
                sortOptions: [SortOptionType]) {
        self.products = products
        self.totalResults = totalResults
        self.filters = filters
        self.sortOptions = sortOptions
    }
    
    // MARK: - Instance functions
    
    /// Products from Search that have already launched.
    ///
    /// - Returns: Products from Search that have already launched.
    public func productsAlreadyLaunched() -> [ProductType] {
        let today = Date()
        return products.filter { launchProduct in
            guard let launchDate = (launchProduct as LaunchProduct).launchDate else {
                return true
            }
            
            return launchDate < today || raffleDateComparator.isLaunchDate(launchDate, inSameDayAs: today)
        }
    }
    
    // MARK: Factory functions
    
    /// New instance with only produdcts that have already launched.
    /// i.e. The `launchDate` is before now.
    ///
    /// - Returns: New isntance.
    public func withOnlyLaunchedProducts() -> LaunchProductSearch {
        return with(newProducts: productsAlreadyLaunched())
    }
    
    /// New instance with updated products.
    ///
    /// - Parameter newProducts: Updated products.
    /// - Returns: New instance.
    public func with(newProducts: [ProductType]) -> LaunchProductSearch {
        return LaunchProductSearch(products: newProducts,
                                   totalResults: newProducts.count,
                                   filters: filters,
                                   sortOptions: sortOptions)
    }
    
    /// New instance with updated products.
    ///
    /// - Parameter nextPageProducts: Next page products.
    /// - Returns: New instance.
    public func with(nextPageProducts: [ProductType]) -> LaunchProductSearch {
        return self.with(newProducts: products + nextPageProducts)
    }

}

// MARK: - Protocol conformance

// MARK: Decodable

extension LaunchProductSearch: Swift.Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case totalResults
        case products
        case filters
        case sortOptions
    }
    
    public init(from decoder: Swift.Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let totalResults = try values.decode(Int.self, forKey: .totalResults)
        let products = try values.decodeIfPresent([ProductType].self, forKey: .products)
        let filters = try values.decodeIfPresent([FilterType].self, forKey: .filters)
        let sortOptions = try values.decodeIfPresent([SortOptionType].self, forKey: .sortOptions)
        
        self.init(products: products ?? [],
                  totalResults: totalResults,
                  filters: filters ?? [],
                  sortOptions: sortOptions ?? [])
    }
    
}
