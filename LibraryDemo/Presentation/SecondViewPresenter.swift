//
//  SecondViewPresenter.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

protocol SecondView: class {
    var presenter: SecondViewPresenter! { get set }
    func display(image from: Data)
    func display(image named: String)
}

class SecondViewPresenter {
    private(set) public weak var view: SecondView?
    private(set) public var imageLoader: ImageLoader
    private(set) public var imageUrl: String

    init(
        view: SecondView,
        imageLoader: ImageLoader,
        imageUrl: String
    ) {
        self.view = view
        self.imageLoader = imageLoader
        self.imageUrl = imageUrl
    }

    func viewDidLoad() {
        imageLoader.getImage(from: imageUrl) { data in
            if let data = data {
                self.view?.display(image: data)
            } else {
                self.view?.display(image: "placeholder")
            }
        }
    }
}
