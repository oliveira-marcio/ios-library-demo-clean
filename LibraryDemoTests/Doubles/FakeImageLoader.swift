//
//  FakeImageLoader.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation

class FakeImageLoader: ImageLoader {
    var data: Data?
    var url: String?
    var shouldFail = false

    func getImage(from url: String, completion: @escaping (Data?) -> Void) {
        self.url = url
        completion(shouldFail ? nil : data)
    }
}
