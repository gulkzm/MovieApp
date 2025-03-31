//
//  MovieDetailCoordinator.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 17.03.25.
//
import UIKit
import Foundation

final class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movie: MovieResult
    
    init(movie: MovieResult, navigationController: UINavigationController) {
        self.movie = movie
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MovieDetailController.self)") as! MovieDetailController
        //let controller = MovieDetailController()    //programmatic olsa
        controller.selectedMovie = movie
        navigationController.show(controller, sender: nil)
    }
}
