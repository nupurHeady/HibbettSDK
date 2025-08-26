//
//  DeepLinkDestination.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

// MARK: - DeepLinkDestination

/// Deep link possible destination.
///
/// - product: The product detail page. Attached is the product id.
/// - category: The category detail page. Attached is the category id and filters for the category.
/// - search: The CDP for the associated search term and filters for the search term.
/// - raffle: The product detail page for a raffle product. Attached is the raffle ID.
/// - webView: A web view for an associated URL.
/// - settings: Open settings
public enum DeepLinkDestination: Equatable {
    case product(String)
    case category(String, [String], String?)
    case search(String, [String], String?)
    case raffle(String)
    case webView(URL)
    case raffleStatus(String)
    case tab(String)
    case settings(String)
    case contentDetail(String)
    case storeFinder(String)
    case orderHistory(isGuest: Bool)
}

public func == (lhs: DeepLinkDestination, rhs: DeepLinkDestination) -> Bool {
    switch (lhs, rhs) {
    case let (.product(id1), .product(id2)):
        return id1 == id2

    case let (.category(id1, filters1, _), .category(id2, filters2, _)):
        return id1 == id2 && filters1 == filters2

    case let (.search(query1, filters1, _), .search(query2, filters2, _)):
        return query1 == query2 && filters1 == filters2

    case let (.contentDetail(id1), .contentDetail(id2)),
         let (.raffle(id1), .raffle(id2)),
         let (.raffleStatus(id1), .raffleStatus(id2)),
         let (.settings(id1), .settings(id2)),
         let (.storeFinder(id1), .storeFinder(id2)),
         let (.tab(id1), .tab(id2)):
        return id1 == id2

    case let (.webView(url1), .webView(url2)):
        return url1 == url2

    case let (.orderHistory(isGuest1), .orderHistory(isGuest2)):
        return isGuest1 == isGuest2

    default:
        return false
    }
}
