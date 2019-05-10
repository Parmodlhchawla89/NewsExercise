//
//  NewYorkTopStoriesTests.swift
//  NewYorkTopStoriesTests
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import XCTest
@testable import NewYorkTopStories

class NewYorkTopStoriesTests: XCTestCase {

    let topStoriesJSON = ["abstract": "Unit Test Abstract",
                          "title": "Unit Test Title",
                          "published_date": "2017-01-28"]
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTopStoriesArticle() {
       let topstories = TopStories(json: topStoriesJSON)
       XCTAssertEqual(topstories.title, "Unit Test Title")
       XCTAssertEqual(topstories.abstract, "Unit Test Abstract")
       XCTAssertEqual(topstories.publishDate, "2017-01-28")
    }

}
