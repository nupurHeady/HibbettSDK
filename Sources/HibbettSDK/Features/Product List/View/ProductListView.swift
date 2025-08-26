//
//  ProductListView.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Product list view protocol.
public protocol ProductListView {

    /// The product list view output.
    var output: ProductListBusinessLogicRequest! { get }

}
