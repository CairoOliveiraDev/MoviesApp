//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation

typealias MoviesFetchedHandler = () -> Void

class MoviesViewModel {
    var movies: [Movie] = []
    var onMoviesFetched: MoviesFetchedHandler?
    private let movieAPI: MovieAPI

    init(movieAPI: MovieAPI = Api()) {
        self.movieAPI = movieAPI
    }

    func fetchMovies() {
        movieAPI.fetchMovies { result in
            switch result {
            case .success(let discover):
                self.movies = discover.results
                self.onMoviesFetched?()
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }

    func numberOfMovies() -> Int {
        return movies.count
    }

    func movie(at index: Int) -> Movie {
        return movies[index]
    }
}
