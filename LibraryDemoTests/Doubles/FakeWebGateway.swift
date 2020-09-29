//
//  GatewaySpyswift.swift
//  LibraryDemo
//
//  Created by Márcio Oliveira on 9/28/20.
//  Copyright © 2020 Márcio Oliveira. All rights reserved.
//

import Foundation
@testable import LibraryDemo

class FakeWebGateway: WebGateway {
    var data: String?
    var shouldFail = false

    func request(url: String, completion: @escaping (String?) -> Void) {
        completion(shouldFail ? nil : data)
    }
}
