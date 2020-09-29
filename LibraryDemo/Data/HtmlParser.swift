//
//  SwiftSoupParser.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
import SwiftSoup

protocol HtmlParser {
    func parse(html: String) -> String
}

struct SwiftSoupParser: HtmlParser {
    func parse(html: String) -> String {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            if let paragraphs = try? doc.select("p") {
                var stringArray = [String]()
                for paragraph in paragraphs.array() {
                    if let text = try? paragraph.text() {
                        stringArray.append(text)
                    }
                }
                return stringArray.joined(separator: "\n")
            }
            return "Nothing"
        } catch Exception.Error(_, let message) {
            return message
        } catch {
            return "error"
        }
    }
}
