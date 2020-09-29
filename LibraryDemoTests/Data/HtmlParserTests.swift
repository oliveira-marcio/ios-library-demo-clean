//
//  SwiftSoupParserTests.swift
//  LibraryDemoTests
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import XCTest
@testable import LibraryDemo

class SwiftSoupParserTests: XCTestCase {

    var htmlParser: SwiftSoupParser!

    override func setUp() {
        htmlParser = SwiftSoupParser()
    }

    func test_should_parse_paragraphs_in_html_text() throws {
        let html = "<html><head><title>First parse</title></head><body>"
        + "<p>First <b>Paragraph</b>.</p>"
        + "<p>Second Paragraph.</p>"
        + "<p>Third Paragraph.</p>"
        + "</body></html>"

        let expectedText = "First Paragraph.\nSecond Paragraph.\nThird Paragraph."

        let parsedText = htmlParser.parse(html: html)

        XCTAssertEqual(parsedText, expectedText)
    }
}
