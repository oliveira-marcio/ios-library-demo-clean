//
//  FirstViewConfigurator.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

protocol FirstViewConfigurator {
    func configure(firstViewController: FirstViewController)
}

class FirstViewConfiguratorImplementation: FirstViewConfigurator {
    func configure(firstViewController: FirstViewController) {
        let router = FirstViewRouterImplementation(firstViewController: firstViewController)
        let presenter = FirstViewPresenter(
            view: firstViewController,
            router: router,
            gateway: SceneDelegate.appEnvironment.dependencies.webGateway,
            imageLoader: SceneDelegate.appEnvironment.dependencies.imageLoader
        )
        
        firstViewController.presenter = presenter
    }
}
