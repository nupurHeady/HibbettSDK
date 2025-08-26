//
//  UICollectionViewReusableViewTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class UICollectionViewReusableViewTests: XCTestCase {

    let viewController = UIViewController()
    var collectionView: UICollectionView!

    override func setUp() {
        super.setUp()

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 200, height: 300.0)

        collectionView = UICollectionView(frame: viewController.view.frame,
                                          collectionViewLayout: flowLayout)
        collectionView.registerCell(cellClass: FakeCollectionViewCell.self)

        viewController.view.addSubview(collectionView)
    }

    func testCollectionViewDequeueReusableCell() {
        _ = viewController.view

        let dataSource = FakeCollectionViewDataSource()
        collectionView.dataSource = dataSource
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? FakeCollectionViewCell

        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.rowNumber, 1)
    }

}

final class FakeCollectionViewCell: UICollectionViewCell {
    var rowNumber: Int = 0
}

final class FakeCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FakeCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.rowNumber = indexPath.row
        return cell
    }

}
