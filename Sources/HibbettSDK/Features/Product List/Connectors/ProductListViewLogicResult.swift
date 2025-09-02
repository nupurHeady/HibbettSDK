//
//  ProductListViewLogicResult.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import PCFSwift
import Wishlist

/// Product view logic result protocol.
public protocol ProductListViewLogicResult: AnyObject, ErrorDisplayable {

    associatedtype DisplayModel
    associatedtype WishlistModel: Wishlistable

    /// Displays the product display model.
    ///
    /// - Parameter productDisplayModel: The product display model to display.
    func displayProductList(productListDisplayModel: DisplayModel)

    /// Displays the upcoming product display model.
    ///
    /// - Parameter upcomingProductListDisplayModel: The upcoming product display model to display.
    func displayUpcomingProductList(upcomingProductListDisplayModel: DisplayModel)

    /// Displays the login page.
    func displayLoginPage(loginSucceededCompletion: (() -> Void)?)

    /// Updates the follow button.
    ///
    /// - Parameter productId: The selected product id.
    func updateFollowButton(forProductId productId: String)

    /// Updates the wishlist button.
    ///
    /// - Parameter productId: The selected product id.
    func updateWishlistButton(forProductId productId: String)

    /// Updates the follow raffle states.
    ///
    /// - Parameter items: The items to use.
    func updateFollowRaffleStates(items: [WishlistModel])

}
