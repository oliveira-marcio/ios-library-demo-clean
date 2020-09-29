//
//  Presenter.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
import SwiftSoup

protocol FirstView: class {
    var presenter: FirstViewPresenter! { get set }
    func display(text: String)
    func display(image from: Data)
    func display(image named: String)
}

class FirstViewPresenter {
    private(set) public weak var view: FirstView?
    private(set) public var router: FirstViewRouter
    private(set) public var gateway: WebGateway
    private(set) public var imageLoader: ImageLoader

    // Just to simplify the app. It should come from domain
    public var imageUrl = "https://historiasinfantisabobrinha.files.wordpress.com/2016/06/blog3.jpg"
    public var requestUrl = "http://yadayada"

    public init(
        view: FirstView,
        router: FirstViewRouter,
        gateway: WebGateway,
        imageLoader: ImageLoader
    ) {
        self.view = view
        self.router = router
        self.gateway = gateway
        self.imageLoader = imageLoader
    }

    func viewDidLoad() {
        gateway.request(url: requestUrl) { data in
            self.view?.display(text: data ?? "Oops")
        }

        imageLoader.getImage(from: imageUrl) { data in
            if let data = data {
                self.view?.display(image: data)
            } else {
                self.view?.display(image: "placeholder")
            }
        }
    }

    func navigateToSecondView() {
        router.navigateToSecondView(imageUrl: imageUrl)
    }
}
