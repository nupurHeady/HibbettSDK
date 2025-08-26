//
//  ProductListPresenter.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Product presenter protocol.
public protocol ProductListPresenter {

    associatedtype ProductListViewLogicResultType: ProductListViewLogicResult

    /// Product list presenter output.
    var output: ProductListViewLogicResultType! { get }

}
