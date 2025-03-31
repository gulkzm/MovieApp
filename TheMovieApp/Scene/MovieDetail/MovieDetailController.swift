//
//  MovieDetailController.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 10.03.25.
//

import UIKit

class MovieDetailController: UIViewController {

    var selectedMovie: MovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO:
        // 1 - call movie detail endpoint
        // 2 - save movie
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let movie = self.selectedMovie else { return }
        FirestoreManager.shared.saveMovie(movie: movie) { error in
            if let error {
                self.showAlert(message: error)
            } else {
                self.showAlert(title: "Success", message: "Save olduuu")
            }
        }
    }
}
