//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation

class MovieDetailViewModel {
    private var movie: Movie?

    func setMovie(_ movie: Movie) {
        self.movie = movie
    }

    func getMovie() -> Movie? {
        return movie
    }
}
