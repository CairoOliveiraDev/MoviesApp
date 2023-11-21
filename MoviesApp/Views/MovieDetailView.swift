//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation
import UIKit

class MovieDetailView: UIView {
    // MARK: - UI Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 26)
        label.numberOfLines = 0
        return label
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let originalLanguageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let releaseDateLabel: UILabel = {
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

        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        setupTitleLabel()
        setupPosterImageView()
        setupOverviewLabel()
        setupVoteAverageLabel()
        setupOriginalLanguageLabel()
        setupReleaseDateLabel()

        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: releaseDateLabel.frame.maxY + 16)
    }

    private func setupTitleLabel() {
        scrollView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    private func setupPosterImageView() {
        scrollView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

        ])
    }

    private func setupOverviewLabel() {
        scrollView.addSubview(overviewLabel)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    private func setupVoteAverageLabel() {
        scrollView.addSubview(voteAverageLabel)
        NSLayoutConstraint.activate([
            voteAverageLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 16),
            voteAverageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            voteAverageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    private func setupOriginalLanguageLabel() {
        scrollView.addSubview(originalLanguageLabel)
        NSLayoutConstraint.activate([
            originalLanguageLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 4),
            originalLanguageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            originalLanguageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    private func setupReleaseDateLabel() {
        scrollView.addSubview(releaseDateLabel)
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: originalLanguageLabel.bottomAnchor, constant: 4),
            releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            releaseDateLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        ])
    }

    // MARK: - Configuration

    func configure(with movie: Movie, posterWidth: CGFloat = 0) {
        titleLabel.text = movie.title

        if !movie.posterPath.isEmpty {
            let screenWidth = UIScreen.main.bounds.width
            let posterHeight = UIScreen.main.bounds.height

            posterImageView.heightAnchor.constraint(equalToConstant: posterHeight).isActive = true
            posterImageView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
            posterImageView.loadImage(from: movie.posterPath, width: screenWidth, height: posterHeight)
        }

        overviewLabel.text = movie.overview
        voteAverageLabel.text = "Vote Average: \(movie.voteAverage)"
        originalLanguageLabel.text = "Original Language: \(movie.originalLanguage)"
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
    }
    
}


