//
//  LibraryDemoTests.swift
//  LibraryDemoTests
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import XCTest
@testable import LibraryDemo

class FirstPresenterTests: XCTestCase {

    var presenter: FirstPresenterImplementation!
    var gateway: FakeWebGateway!
    var imageLoader: FakeImageLoader!
    var viewSpy: FirstViewSpy!

    override func setUp() {
        gateway = FakeWebGateway()
        imageLoader = FakeImageLoader()
        viewSpy = FirstViewSpy()
        presenter = FirstPresenterImplementation(gateway: gateway, imageLoader: imageLoader)
        presenter.view = viewSpy
    }

    func test_text_and_image_were_displayed_when_presenter_did_load() {
        gateway.data = "String Test"
        imageLoader.data = Data()

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.text, "String Test")
        XCTAssertEqual(viewSpy.image, Data())
    }

    func test_error_text_was_displayed_when_gateway_fails() {
        gateway.shouldFail = true

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.text, "Oops")
    }
}
