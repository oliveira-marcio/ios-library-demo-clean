//
//  SecondViewController.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/27/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var presenter: SecondViewPresenter!

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension SecondViewController: SecondView {
    func display(image from: Data) {
        imageView.image = UIImage(data: from)
    }

    func display(image named: String) {
        imageView.image = UIImage(named: named)
    }
}
