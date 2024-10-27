//
//  Recipe.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

struct Recipe: Decodable {
    let name: String?
    let cuisine: String?
    let photo_url_small: String?
    let photo_url_large: String?
    let source_url: String?
    let uuid: String
    let youtube_url: String?
}
