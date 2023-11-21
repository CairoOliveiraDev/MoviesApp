//
//  MovieTableViewCellTest.swift
//  MoviesAppTests
//
//  Created by Cairo Oliveira on 18/11/23.
//

import XCTest
@testable import MoviesApp

class MovieTableViewCellTest: XCTestCase {
    var cell: MovieTableViewCell!

    override func setUp() {
        super.setUp()
        cell = MovieTableViewCell()
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }

    func testConfigure() {
        let movie = Movie(id: 1, title: "Test Movie", posterPath: "path/to/image", voteAverage: 8.0, releaseDate: "2023-01-01", overview: "Test overview", originalLanguage: "en")
        let posterWidth: CGFloat = 100.0

        cell.configure(with: movie, posterWidth: posterWidth)

        XCTAssertEqual(cell.titleLabel.text, movie.title)
        XCTAssertEqual(cell.voteAverageLabel.text, "Vote Average: \(movie.voteAverage)")
        XCTAssertEqual(cell.releaseDateLabel.text, "Release Date: \(movie.releaseDate)")

        
    }

   
}

