//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation
import UIKit

import UIKit

class MovieDetailView: UIView {
    // MARK: - UI Components

     let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 26)
        label.numberOfLines = 0
        return label
    }()

     let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

     let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

     let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     let originalLanguageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Configuration

    private func setupUI() {
        backgroundColor = .white
        setupTitleLabel()
        setupPosterImageView()
        setupOverviewLabel()
        setupVoteAverageLabel()
        setupOriginalLanguageLabel()
        setupReleaseDateLabel()
    }

    private func setupTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setupPosterImageView() {
        addSubview(posterImageView)
        let screenWidth = UIScreen.main.bounds.width
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.widthAnchor.constraint(equalTo: widthAnchor),
            posterImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3)
        ])
    }

    private func setupOverviewLabel() {
        addSubview(overviewLabel)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setupVoteAverageLabel() {
        addSubview(voteAverageLabel)
        NSLayoutConstraint.activate([
            voteAverageLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 16),
            voteAverageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            voteAverageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setupOriginalLanguageLabel() {
        addSubview(originalLanguageLabel)
        NSLayoutConstraint.activate([
            originalLanguageLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 16),
            originalLanguageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            originalLanguageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setupReleaseDateLabel() {
        addSubview(releaseDateLabel)
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: originalLanguageLabel.bottomAnchor, constant: 16),
            releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            releaseDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    // MARK: - Configuration

    func configure(with movie: Movie, posterWidth: CGFloat = 0) {
        titleLabel.text = movie.title

        if !movie.posterPath.isEmpty {
                let screenWidth = UIScreen.main.bounds.width

                posterImageView.contentMode = .scaleAspectFit
                posterImageView.translatesAutoresizingMaskIntoConstraints = false
                posterImageView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true

            
            posterImageView.loadImage(from: movie.posterPath, width: screenWidth, height: 0)
                }

            overviewLabel.text = movie.overview
            voteAverageLabel.text = "Vote Average: \(movie.voteAverage)"
            originalLanguageLabel.text = "Original Language: \(movie.originalLanguage)"
            releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        }
}
