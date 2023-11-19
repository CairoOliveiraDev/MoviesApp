//
//  UIImageView+Extension.swift
//  MoviesApp
//
//  Created by Cairo Oliveira on 18/11/23.
//

import UIKit

extension UIImageView {
    func loadImage(from posterURL: String, width: CGFloat, height: CGFloat) {
        guard let url = makeURL(with: posterURL) else {
            print("Invalid poster URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                print("Error loading poster image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to create UIImage from data")
                return
            }

            let resizedImage = image.resize(toWidth: width, height: height)

            DispatchQueue.main.async {
                self?.updateImage(resizedImage)
            }
        }.resume()
    }

    private func makeURL(with posterURL: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p/w500"
        return URL(string: baseURL + posterURL)
    }

    private func updateImage(_ image: UIImage) {
        self.contentMode = .scaleAspectFit
        self.image = image
    }
}

extension UIImage {
    func resize(toWidth width: CGFloat, height: CGFloat) -> UIImage {
        let newSize = CGSize(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }

    func resize(toWidth width: CGFloat) -> UIImage {
        let aspectRatio = size.width / size.height
        let newSize = CGSize(width: width, height: width / aspectRatio)
        return resize(toWidth: newSize.width, height: newSize.height)
    }
}
