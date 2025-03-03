//
//  ActorEndpoint.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 18.02.25.
//

import Foundation

enum ActorEndpoint {
    case actor(page: Int)
    case actorMovies(id: Int)
    
    var path: String {
        switch self {
        case .actor(let page):
            return NetworkHelper.shared.configureURL(endpoint: "person/popular?page=\(page)")
        case .actorMovies(let id):
            return NetworkHelper.shared.configureURL(endpoint: "person/\(id)/movie_credits")

        }
    }
}
