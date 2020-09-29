//
//  FirstViewRouterSpy.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

class FirstViewRouterSpy: FirstViewRouter {
    var didNavigateToSecondView = false
    var imageUrl: String?
    var navigateToSecondViewCompletion: (() -> Void)?

    func navigateToSecondView(imageUrl: String) {
        self.imageUrl = imageUrl
        didNavigateToSecondView = true
        navigateToSecondViewCompletion?()
    }
}
