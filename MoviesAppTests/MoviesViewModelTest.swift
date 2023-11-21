//
//  MoviesViewModelTest.swift
//  MoviesAppTests
//
//  Created by Cairo Oliveira on 18/11/23.
//

import XCTest
@testable import MoviesApp

class MoviesViewModelTest: XCTestCase {
    var viewModel: MoviesViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MoviesViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchMovies() {
        let expectation = XCTestExpectation(description: "Fetch movies")

        viewModel.onMoviesFetched = {
            XCTAssertTrue(self.viewModel.numberOfMovies() > 0, "Movies fetched successfully")
            expectation.fulfill()
        }

        viewModel.fetchMovies()

        wait(for: [expectation], timeout: 5.0)
    }

}
