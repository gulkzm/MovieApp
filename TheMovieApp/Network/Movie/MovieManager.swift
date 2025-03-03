//
//  MovieManager.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 25.02.25.
//

import Foundation

class MovieManager {
    let manager = NetworkManager()
    
    func getMovieList(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void)) {
        let path = endpoint.path
    }
}
