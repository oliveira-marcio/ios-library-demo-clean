//
//  MainNavigator.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import UIKit

protocol Navigator {
    var navigationController: UIViewController? { set get }
    func navigateToSecondView()
    func prepare(for segue: Any, sender: Any?)
}

class MainNavigator: Navigator {
    var navigationController: UIViewController?
    
    func navigateToSecondView() {
        navigationController?.performSegue(withIdentifier: "showSecondView", sender: nil)
    }

    func prepare(for segue: Any, sender: Any?) {
         guard let _ = segue as? UIStoryboardSegue else { return }
    }
}
