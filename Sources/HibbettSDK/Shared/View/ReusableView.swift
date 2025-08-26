//
//  ReusableView.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/// Defines a reusable table view or collection view cell.
public protocol ReusableView: class {

    /// Default reuse identifier is set with the class name.
    static var reuseIdentifier: String { get }

}

public extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}
