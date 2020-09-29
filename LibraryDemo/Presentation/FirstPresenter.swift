//
//  Presenter.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
import SwiftSoup

protocol FirstView {
    func display(text: String)
    func display(image: Data?)
}

protocol FirstPresenter {
    var view: FirstView? { set get }
    func viewDidLoad()
}

class FirstPresenterImplementation : FirstPresenter {
    var view: FirstView?
    private let gateway: WebGateway!
    private let imageLoader: ImageLoader!

    init(gateway: WebGateway, imageLoader: ImageLoader) {
        self.gateway = gateway
        self.imageLoader = imageLoader
    }

    func viewDidLoad() {
        gateway.request(url: "http://yadayada") { data in
            self.view?.display(text: data ?? "Oops")
        }

        imageLoader.getImage(from: "https://historiasinfantisabobrinha.files.wordpress.com/2016/06/blog3.jpg") { data in
            self.view?.display(image: data)
        }
    }
}
