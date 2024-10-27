//
//  CahceManagerTests.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/25/24.
//

import XCTest
@testable import FetchTest

class CacheManagerTests: XCTestCase {
    let cacheManager = CacheManager.shared
    
    let imageURL = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
    var viewModel: RecipeCellViewModel? = RecipeCellViewModel(recipe: Recipe(name: "TestName", cuisine: "TestCuisine", photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", source_url: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", youtube_url: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
    
    override func setUp() {
        super.setUp()
        cacheManager.cleanCache() // Clear cache before each test
    }
    
    func test_getDataFromEmptyCache_workedCorrectly() {
        let imageData = CacheManager.shared.getImage(by: imageURL)
        XCTAssertNil(imageData.mainImage)
        XCTAssertEqual(imageData.state, .loading)
    }
    
    func test_observersAdding_workedCorrectly() {
        viewModel?.getImage()
        
        XCTAssertNotNil(CacheManager.shared.observers[imageURL])
    }
}
