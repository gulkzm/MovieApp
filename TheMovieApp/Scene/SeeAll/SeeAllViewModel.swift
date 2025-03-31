//
//  SeeAllViewModel.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 11.03.25.
//

import Foundation

class SeeAllViewModel {
    
    var model: HomeModel
    var movie: Movie?
    var usecase: MovieManagerUseCase
    
    var success: (() -> Void)?
    
    init(model: HomeModel, usecase: MovieManagerUseCase) {
        self.model = model
        self.usecase = usecase
    }
    
    func getMovieitems() {
        usecase.getMovieList(page: (movie?.page ?? 1) + 1,
                             endpoint: model.title.endpoint) { movie, error in
            if let error {
                
            } else if let movie {
                self.movie = movie
                self.model.items.append(contentsOf: movie.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == model.items.count-2 && (movie?.page ?? 1 <= movie?.totalPages ?? 1) {
          getMovieitems()
        }
    }
}
