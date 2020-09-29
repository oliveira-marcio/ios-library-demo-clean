//
//  AppEnvironment.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

struct AppEnvironment {
    let dependencies: DependencyResolver
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let dependencies = DependencyResolver()
        return AppEnvironment(dependencies: dependencies)
    }
}

final class DependencyResolver {
    lazy var htmlParser: HtmlParser = SwiftSoupParser()
    lazy var webGateway: WebGateway = WebGatewayImplementation(htmlParser: htmlParser)
    lazy var imageLoader: ImageLoader = KingfisherImageLoader()
}
