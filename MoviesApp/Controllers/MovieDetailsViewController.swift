//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private let movie: Movie
    private let movieDetailView = MovieDetailView()

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        configureMovieDetailView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    override func loadView() {
        view = movieDetailView
    }

    private func configureMovieDetailView() {
        movieDetailView.configure(with: movie)
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "Movie Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.largeTitleDisplayMode = .always
    }
}



