//
//  ProductListBusinessLogicResponse.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import PCFSwift

/// Product list business logic response.
public protocol ProductListBusinessLogicResponse: Errorable {

    /// Indicates when the launch calendar product list was found.
    ///
    /// - Parameter productSearch: The product search to use.
    /// - Parameter showRaffleOnly: If true, view will show raffle only products
    func launchCalendarProductListDataFound(productSearch: LaunchProductSearch, showRaffleOnly: Bool)

    /// Indicates when the released product list was found.
    ///
    /// - Parameter productSearch: The product search to use.
    func releasedProductListDataFound(productSearch: LaunchProductSearch)

    /// Indicates when the user needs to login.
    func userNeedsToLogin()
    
    /// Indicates when the user needs to login.
    func userNeedsToLogin(loginSucceededCompletion: (() -> Void)?)
    
    /// Indicates the product list layout needs to be updated.
    func updateProductListLayout()

    /// Indicates to the output when the follow state will be updated.
    ///
    /// - Parameter productId: The selected product id.
    func updateFollowState(forProductId productId: String)

    /// Indicates to the output when the wishlist state will be updated.
    ///
    /// - Parameter productId: The selected product id.
    func updateWishlistState(forProductId productId: String)

    /// Indicates when follow raffle states have been found.
    ///
    /// - Parameter items: The follow raffle states.
    func followRaffleStatesFound(items: [Wishlistable])

}

public extension ProductListBusinessLogicResponse {
    
    func userNeedsToLogin() {
        userNeedsToLogin(loginSucceededCompletion: nil)
    }
    
}
