//
//  ViewController.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/24/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import UIKit
import Kingfisher

class FirstViewController: UIViewController {

    var configurator = FirstViewConfiguratorImplementation()
    var presenter: FirstViewPresenter!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(firstViewController: self)
        presenter.viewDidLoad()
    }

    @IBAction func nextView(_ sender: Any) {
        presenter.navigateToSecondView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.router.prepare(for: segue, sender: sender)
    }
}

extension FirstViewController: FirstView {
    func display(text: String) {
        textView.text = text
    }

    func display(image from: Data) {
        imageView.image = UIImage(data: from)
    }

    func display(image named: String) {
        imageView.image = UIImage(named: named)
    }
}
