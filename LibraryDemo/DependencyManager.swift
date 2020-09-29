//
//  Swinjector.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class DependencyManager {
    static var defaultContainer = Container()

    static var firstPresenter: FirstPresenter =
        defaultContainer.resolve(FirstPresenter.self)!

    private static var htmlParser: HtmlParser = defaultContainer.resolve(HtmlParser.self)!

    private static var webGateway: WebGateway = defaultContainer.resolve(WebGateway.self)!

    private static var imageLoader: ImageLoader = defaultContainer.resolve(ImageLoader.self)!

    static var navigator: Navigator = defaultContainer.resolve(Navigator.self)!

    static func setup() {
        defaultContainer.register(HtmlParser.self) { resolver in SwiftSoupParser() }

        defaultContainer.register(WebGateway.self) { resolver in WebGatewayImplementation(htmlParser: htmlParser) }

        defaultContainer.register(ImageLoader.self) { resolver in KingfisherImageLoader() }

        defaultContainer.register(Navigator.self) { resolver in
            return MainNavigator()
        }

        defaultContainer.register(FirstPresenter.self) { resolver in
            FirstPresenterImplementation(gateway: webGateway, imageLoader: imageLoader)
        }
    }
}
