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

    var presenter: FirstViewPresenter!
    var fakeGateway: FakeWebGateway!
    var fakeImageLoader: FakeImageLoader!
    var routerSpy: FirstViewRouterSpy!
    var viewSpy: FirstViewSpy!

    override func setUp() {
        viewSpy = FirstViewSpy()
        routerSpy = FirstViewRouterSpy()
        fakeGateway = FakeWebGateway()
        fakeImageLoader = FakeImageLoader()
        presenter = FirstViewPresenter(view: viewSpy, router: routerSpy, gateway: fakeGateway, imageLoader: fakeImageLoader)
    }

    func test_text_and_image_were_displayed_when_presenter_did_load() {
        fakeGateway.data = "String Test"
        fakeImageLoader.data = Data()

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.text, "String Test")
        XCTAssertEqual(viewSpy.imageData, Data())
    }

    func test_it_should_request_given_url_from_gateway_when_presenter_did_load() {
        presenter.requestUrl = "http://url"

        presenter.viewDidLoad()

        XCTAssertEqual(fakeGateway.url, "http://url")
    }

    func test_it_should_request_given_url_from_image_loader_when_presenter_did_load() {
        presenter.imageUrl = "http://url"

        presenter.viewDidLoad()

        XCTAssertEqual(fakeImageLoader.url, "http://url")
    }

    func test_error_text_was_displayed_when_gateway_fails() {
        fakeGateway.shouldFail = true

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.text, "Oops")
    }

    func test_placeholder_image_was_displayed_when_image_loader_fails() {
        fakeImageLoader.shouldFail = true

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.imageName, "placeholder")
    }

    func test_it_should_navigate_to_second_view_passing_current_image_url() {
        presenter.imageUrl = "http://url"

        presenter.navigateToSecondView()

        XCTAssertEqual(routerSpy.imageUrl, "http://url")
    }
}
