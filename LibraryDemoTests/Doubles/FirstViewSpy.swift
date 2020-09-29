//
//  File.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

class FirstViewSpy: FirstView {
    var text: String?
    var image: Data?

    func display(text: String) {
        self.text = text
    }

    func display(image: Data?) {
        self.image = image
    }
}
