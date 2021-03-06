//
//  SecondViewConfigurator.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

import Foundation

protocol SecondViewConfigurator {
    func configure(secondViewController: SecondViewController, imageUrl: String)
}

class SecondViewConfiguratorImplementation: SecondViewConfigurator {
    func configure(secondViewController: SecondViewController, imageUrl: String) {
        let presenter = SecondViewPresenter(
            view: secondViewController,
            imageLoader: SceneDelegate.appEnvironment.dependencies.imageLoader,
            imageUrl: imageUrl)

        secondViewController.presenter = presenter
    }
}
