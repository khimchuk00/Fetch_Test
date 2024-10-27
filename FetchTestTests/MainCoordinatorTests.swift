//
//  MainCoordinatorTests.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/26/24.
//

import XCTest
@testable import FetchTest

class MainCoordinatorTests: XCTestCase {
    func test_messagesStart_workCorrectly() {
        let sut = MainCoordinator(presenter: UINavigationController())

        sut.start()

        XCTAssert(sut.presenter.visibleViewController is MainViewController)
    }
}
