//
//  MovieManager.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 25.02.25.
//

import Foundation

protocol MovieManagerUseCase {
    func getMovieList(page: Int, endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void))
}

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getMovieList(page: Int, endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void)) {
        var path = ""
        switch endpoint {
        case .nowPlaying(let _):
            path = MovieEndpoint.nowPlaying(page: page).path
        case .popular(let _):
            path = MovieEndpoint.popular(page: page).path
        case .topRated(let _):
            path = MovieEndpoint.topRated(page: page).path
        case .upcoming(let _):
            path = MovieEndpoint.upcoming(page: page).path
        }
        manager.request(path: path, model: Movie.self, completion: completion)
    }
}
