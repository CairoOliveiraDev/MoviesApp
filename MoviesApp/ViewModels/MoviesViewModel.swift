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


    func fetchMovies() {
        let apiKey = "15c56089249c2ee0c211427a2262fc74"
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=\(apiKey)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching movies: \(error)")
                return
            }

            guard let data = data else {
                print("Error: No data received")
                return
            }

            do {
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON: \(jsonString ?? "No JSON received")")

                let discover = try JSONDecoder().decode(Discover.self, from: data)
                self.movies = discover.results
                self.onMoviesFetched?()
            } catch let error {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }

    func numberOfMovies() -> Int {
        return movies.count
    }

    func movie(at index: Int) -> Movie {
        return movies[index]
    }
}
