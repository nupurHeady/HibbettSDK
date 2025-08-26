//
//  UITableView+ReusableView.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UITableView {

    /// Dequeues a reusable table view cell.
    ///
    /// - Returns: The table view cell.
    func dequeueReusableCell<T: ReusableView>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("No table view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    /// Dequeues a table view cell based on the given index path.
    ///
    /// - Parameter indexPath: The index path to use.
    /// - Returns: The table view cell.
    func dequeueReusableCellForIndex<T: ReusableView>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("No table view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }
    
    /// Dequeues a table view header/footer based on the given index path.
    ///
    /// - Returns: The table view header/footer.
    func dequeueReusableHeaderFooterView<T: ReusableView>() -> T? {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            assertionFailure("No table view cell could be dequeued with identifier \(T.reuseIdentifier)")
            return nil
        }

        return view
    }

    /// Registers the table view cell based on the given identifier from a nib file.
    ///
    /// - Parameter cellIdentifier: The cell identifier to use.
    func registerCellFromNib(cellIdentifier: String) {
        register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    /// Registers the table view header/footer based on the given identifier from a nib file.
    ///
    /// - Parameter identifier: The cell identifier to use.
    func registerHeaderFooterFromNib(identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }

    /// Registers the table view cell based on the given identifier when the cell was created from manual layout.
    ///
    /// - Parameter cellClass: The cell class to use.
    func registerCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

}
