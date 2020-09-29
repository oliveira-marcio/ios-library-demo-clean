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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    var presenter = DependencyManager.firstPresenter
    var navigator = DependencyManager.navigator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigator.navigationController = self
        presenter.view = self
        presenter.viewDidLoad()
    }

    @IBAction func nextView(_ sender: Any) {
        navigator.navigateToSecondView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        navigator.prepare(for: segue, sender: sender)
    }
}

extension FirstViewController: FirstView {
    func display(text: String) {
        textView.text = text
    }

    func display(image: Data?) {
        if let image = image {
            imageView.image = UIImage(data: image)
        } else {
            imageView.image = UIImage(named: "placeholder")
        }
    }
}
