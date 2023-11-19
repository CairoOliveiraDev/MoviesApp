//
//  Movie.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    let originalLanguage: String

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case overview
        case originalLanguage = "original_language"
    }
    
}
