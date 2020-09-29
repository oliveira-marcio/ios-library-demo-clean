//
//  SecondViewPresenterTest.swift
//  LibraryDemoTests
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import XCTest
@testable import LibraryDemo

class SecondViewPresenterTests: XCTestCase {

    var presenter: FirstViewPresenter!
    var fakeGateway: FakeWebGateway!
    var fakeImageLoader: FakeImageLoader!
    var routerSpy: FirstViewRouterSpy!
    var viewSpy: FirstViewSpy!

    override func setUp() {
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
