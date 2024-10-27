//
//  GetRecepiesRequest.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

final class GetRecepiesRequest: Request {
    convenience init() {
        self.init(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!,
                  method: .GET)
    }
}

