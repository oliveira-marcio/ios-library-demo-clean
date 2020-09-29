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

    var presenter: SecondViewPresenter!
    var fakeImageLoader: FakeImageLoader!
    var viewSpy: SecondViewSpy!

    override func setUp() {
        viewSpy = SecondViewSpy()
        fakeImageLoader = FakeImageLoader()
        presenter = SecondViewPresenter(
            view: viewSpy,
            imageLoader: fakeImageLoader,
            imageUrl: "http://url"
        )
    }

    func test_image_were_displayed_when_presenter_did_load() {
        fakeImageLoader.data = Data()

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.imageData, Data())
    }

    func test_placeholder_image_was_displayed_when_image_loader_fails() {
        fakeImageLoader.shouldFail = true

        presenter.viewDidLoad()

        XCTAssertEqual(viewSpy.imageName, "placeholder")
    }
}
