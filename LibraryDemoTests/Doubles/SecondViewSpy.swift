//
//  SecondViewSpy.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

class SecondViewSpy: SecondView {
    var presenter: SecondViewPresenter!

    var imageData: Data?
    var imageName: String?

    func display(image from: Data) {
        self.imageData = from
    }

    func display(image named: String) {
        self.imageName = named
    }
}
