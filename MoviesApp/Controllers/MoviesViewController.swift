//
//  MoviesViewController.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 17/11/23.
//

import UIKit

class MoviesViewController: UIViewController {
    private var viewModel: MoviesViewModel!
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        viewModel.fetchMovies()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.topItem?.title = "Popular Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.largeTitleDisplayMode = .always
    }

    private func setupUI() {

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }

    private func setupViewModel() {
        viewModel = MoviesViewModel()
        viewModel.onMoviesFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }

        let movie = viewModel.movie(at: indexPath.row)
        let posterWidth: CGFloat = tableView.bounds.width * 0.3
        cell.configure(with: movie, posterWidth: posterWidth)

        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byWordWrapping
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movie(at: indexPath.row)
        let movieDetailViewController = MovieDetailViewController(movie: movie)

        let nav = UINavigationController(rootViewController: movieDetailViewController)
        nav.modalPresentationStyle = .pageSheet
        nav.modalTransitionStyle = .coverVertical
        present(nav, animated: true)
    }
}

