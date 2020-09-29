//
//  WebGateway.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

protocol WebGateway {
    func request(url: String, completion: @escaping (String?) -> Void)
}

struct WebGatewayImplementation: WebGateway {
    let htmlParser: HtmlParser!

    func request(url: String, completion: @escaping (String?) -> Void) {
        let html = "<html><head><title>First parse</title></head><body>"
        + "<p>First <b>Paragraph</b>.</p>"
        + "<p>Second Paragraph.</p>"
        + "<p>Third Paragraph.</p>"
        + "</body></html>"
        let parsedHtml = htmlParser.parse(html: html)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(parsedHtml)
        }
    }
}
