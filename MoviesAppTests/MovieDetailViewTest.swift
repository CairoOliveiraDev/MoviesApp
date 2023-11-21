//
//  MovieDetailViewTest.swift
//  MoviesAppTests
//
//  Created by Cairo Oliveira on 18/11/23.
//

import XCTest
@testable import MoviesApp

class MovieDetailViewTest: XCTestCase {
    var view: MovieDetailView!

    override func setUp() {
        super.setUp()
        view = MovieDetailView()
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }

    func testConfigure() {
        let movie = Movie(id: 0, title: "Test Movie", posterPath: "path/to/image", voteAverage: 8.0, releaseDate: "2023-01-01", overview: "Test overview", originalLanguage: "en")
                let posterWidth: CGFloat = 200.0

        view.configure(with: movie, posterWidth: posterWidth)

        XCTAssertEqual(view.titleLabel.text, movie.title)
        XCTAssertEqual(view.voteAverageLabel.text, "Vote Average: \(movie.voteAverage)")
        XCTAssertEqual(view.releaseDateLabel.text, "Release Date: \(movie.releaseDate)")

            }

    
}

