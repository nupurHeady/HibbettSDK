//
//  UICollectionView+ReusableView.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UICollectionView {

    /// Dequeues a reusable collection view cell.
    ///
    /// - Parameter indexPath: The index path to use.
    /// - Returns: The collection view cell.
    func dequeueReusableCell<T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("No collection view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    /// Registers the collection view cell based on the given identifier when the cell was created from a nib file.
    ///
    /// - Parameter cellIdentifier: The cell identifier to use.
    func registerCellFromNib(cellIdentifier: String) {
        register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }

    /// Registers the collection view cell based on the given identifier when the cell was created from manual layout.
    ///
    /// - Parameters:
    ///   - cellClass: The cell class to use.
    func registerCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

}
