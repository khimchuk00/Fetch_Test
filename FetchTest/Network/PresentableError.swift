//
//  PresentableError.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

protocol PresentableError: Error {
    var localizedTitle: String { get }
    var localizedMessage: String { get }
}

