//
//  FirstViewRouter.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/29/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
import UIKit

protocol FirstViewRouter: ViewRouter {
    func navigateToSecondView()
}

enum FirstViewSegue: String {
    case toSecondView = "toSecondView"
}


class FirstViewRouterImplementation: FirstViewRouter {

    fileprivate weak var firstViewController: FirstViewController?

    init(firstViewController: FirstViewController) {
        self.firstViewController = firstViewController
    }

    func navigateToSecondView() {
        DispatchQueue.main.async {
            self.firstViewController?.performSegue(
                withIdentifier: FirstViewSegue.toSecondView.rawValue,
                sender: nil
            )
        }
    }

    func prepare(for segue: Any, sender: Any?) {
        guard let segue = segue as? UIStoryboardSegue else { return }

        switch segue.identifier {
        case FirstViewSegue.toSecondView.rawValue:
            guard let secondViewController = segue.destination as? SecondViewController else { return }
            let configurator = SecondViewConfiguratorImplementation()
            configurator.configure(secondViewController: secondViewController)
        default: break
        }
    }
    
}
