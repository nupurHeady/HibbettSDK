//
//  UITableViewReusableViewTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class UITableViewReusableViewTests: XCTestCase {

    let viewController = UIViewController()
    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        tableView = UITableView(frame: viewController.view.frame)
        tableView.registerCell(cellClass: FakeTableViewCell.self)
    }

    func testTableViewDequeueReusableCell_whenUsingDequeueWithIndexPath() {
        _ = viewController.view

        let dataSource = FakeTableViewDataSourceUsingDequeueWithIndexPath()
        tableView.dataSource = dataSource
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? FakeTableViewCell

        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.rowNumber, 1)
    }

    func testTableViewDequeueReusableCell() {
        _ = viewController.view

        let dataSource = FakeTableViewDataSource()
        tableView.dataSource = dataSource
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? FakeTableViewCell

        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.rowNumber, 1)
    }

}

final class FakeTableViewCell: UITableViewCell {
    var rowNumber: Int = 0
}

// swiftlint:disable type_name
final class FakeTableViewDataSourceUsingDequeueWithIndexPath: NSObject, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FakeTableViewCell = tableView.dequeueReusableCellForIndex(indexPath: indexPath)
        cell.rowNumber = indexPath.row
        return cell
    }

}

final class FakeTableViewDataSource: NSObject, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FakeTableViewCell = tableView.dequeueReusableCell()
        cell.rowNumber = indexPath.row
        return cell
    }

}
