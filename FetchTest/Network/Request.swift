//
//  Request.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

enum Method: String {
    case GET, POST, PUT, DELETE
}

/// Request model
class Request {
    let url: URL
    let method: Method

    init(url: URL,
         method: Method) {
        self.url = url
        self.method = method
    }
}

// MARK: - Validation
extension Request {
    enum ValidationResult {
        case success
        case error(APIError.Code)
    }
}

// MARK: - URL Request conversion
extension Request {
    /// Convert `Request` instance to `URLRequest`
    var asURLRequest: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
