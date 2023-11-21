//
//  Api.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 21/11/23.
//

import Foundation


protocol MovieAPI {
    func fetchMovies(completion: @escaping (Result<Discover, Error>) -> Void)
}

class Api: MovieAPI {
    func fetchMovies(completion: @escaping (Result<Discover, Error>) -> Void) {
        let apiKey = "15c56089249c2ee0c211427a2262fc74"
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=\(apiKey)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let discover = try JSONDecoder().decode(Discover.self, from: data)
                completion(.success(discover))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
