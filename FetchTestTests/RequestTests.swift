//
//  RequestTests.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/26/24.
//

import XCTest
@testable import FetchTest

class RequestTests: XCTestCase {
    func test_asURLRequest_withoutQueryItems_requestURLIsCorrect() throws {
        let url = URL(string: "https://www.google.com")!

        let request = Request(url: url, method: .GET)

        let urlRequest = request.asURLRequest

        XCTAssertEqual(urlRequest.url?.absoluteString, "https://www.google.com")
    }
}
