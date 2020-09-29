//
//  File.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

class FirstViewSpy: FirstView {
    var presenter: FirstViewPresenter!
    
    var text: String?
    var imageData: Data?
    var imageName: String?

    func display(text: String) {
        self.text = text
    }

    func display(image from: Data) {
        self.imageData = from
    }

    func display(image named: String) {
        self.imageName = named
    }
}
