//
//  Extension.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 14.02.25.
//

import UIKit
import Foundation
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        let fullPath = NetworkHelper.shared.imageBaseURL + url
        guard let url = URL(string: fullPath) else { return }
        self.kf.setImage(with: url)
    }
}

extension UIViewController {
    func showAlert(title: String = "Error", message: String? = nil, actionTitle: String = "Ok") {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        controller.addAction(action)
        present(controller, animated: true)
    }
}
