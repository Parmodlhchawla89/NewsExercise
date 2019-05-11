//
//  NewYorkTopStoriesUITests.swift
//  NewYorkTopStoriesUITests
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import XCTest

class NewYorkTopStoriesUITests: XCTestCase {

    func testExample() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        sleep(5)
        let tablesQuery = app.tables
        snapshot("01NewsTable")
        tablesQuery.cells.element(boundBy: 1).tap()
        snapshot("02Details") 
        let mostPopularButton = app.navigationBars["Details"].buttons["Most Popular"]
        mostPopularButton.tap()
        tablesQuery.cells.element(boundBy: 3).tap()
        mostPopularButton.tap()
        tablesQuery.cells.element(boundBy: 2).tap()
        mostPopularButton.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
