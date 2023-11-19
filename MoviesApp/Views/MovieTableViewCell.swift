//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"

     let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 15
        return view
    }()

     let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

     let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

     let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        return label
    }()

     let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()

     let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()

    private var posterImageViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(posterImageView)
        containerView.addSubview(infoStackView)

        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(voteAverageLabel)
        infoStackView.addArrangedSubview(releaseDateLabel)

        posterImageViewHeightConstraint = posterImageView.heightAnchor.constraint(equalToConstant: 150)
        posterImageViewHeightConstraint.isActive = true

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            posterImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            posterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            posterImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: 150), // Adjust width as needed
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1.5),

            infoStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            infoStackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 8),
            infoStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            infoStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with movie: Movie, posterWidth: CGFloat) {
        titleLabel.text = movie.title
        voteAverageLabel.text = "Vote Average: \(movie.voteAverage)"
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"

        if !movie.posterPath.isEmpty {
                
                let posterWidth = posterWidth > 0 ? posterWidth : UIScreen.main.bounds.width * 0.3
                let posterHeight = posterWidth * 1.5

                posterImageView.loadImage(from: movie.posterPath, width: posterWidth, height: posterHeight)
            }
    }
}

