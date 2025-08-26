//
//  ProductListBusinessLogicRequest.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import PCFSwift

/// Product list business logic request protocol.
public protocol ProductListBusinessLogicRequest {

    /// Asks for the launch calendar product list.
    func getLaunchCalendarProductList()
    
    /// Load launch calendar products based on filters applied
    /// - Parameter launchCalendarProducts: Launch calendar products
    func filteredLaunchCalendarProducts(_ launchCalendarProducts: LaunchProductSearch)
    
    /// Indicates show raffle only switch was toggled
    /// - Parameters:
    ///   - showRaffleOnly: If true, view will show raffle only products
    ///   - launchCalendarProducts: Launch calendar products
    func updateShowRaffleOnly(_ showRaffleOnly: Bool, launchCalendarProducts: LaunchProductSearch)
    
    /// Indicates show raffle only switch was toggled
    /// - Parameters:
    ///   - showRaffleOnly: If true, view will show raffle only products
    func updateShowRaffleOnly(_ showRaffleOnly: Bool)
    
    /// Apply filter changes to display on the view
    func applyFilterToLaunchCalendarProduct()
    
    /// Clear filter options and display original unfiltered launch calendar products
    func clearFilterOptions()

    /// Asks for the released product list.
    func getReleasedProductList()
    
    /// Asks for the released product list next page.
    func getReleasedProductListNextPage()
    
    /// Return true if loading the next page.
    var isLoadingPage: Bool { get }
    
    /// Asks for all the follow raffle states.
    func getFollowRaffleStates()
    
    /// Indicates the layout button was tapped.
    func layoutButtonTapped()

    /// Indicates when a follow raffle item was tapped.
    ///
    /// - Parameters:
    ///   - productId: The product id associated with the follow event.
    ///   - state: The state to update to.
    func followRaffleTapped(forProductId productId: String, withState state: WishlistItemState)

    /// Indicates when a wishlist button was tapped.
    ///
    /// - Parameters:
    ///   - productId: The product id associated with the wishlist event.
    ///   - state: The state to update to.
    func wishlistButtonTapped(forProductId productId: String, withState state: WishlistItemState)

}
