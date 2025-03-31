//
//  MovieEndpoint.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 18.02.25.
//

import Foundation

enum MovieEndpoint {
    case nowPlaying(page: Int)    //= "movie/now_playing"
    case popular(page: Int)       //= "movie/popular"
    case topRated(page: Int)     //= "movie/top_rated"
    case upcoming(page: Int)     //= "movie/upcoming"
    
    
    var path: String {
        switch self {
        case .nowPlaying(let page):
            NetworkHelper.shared.configureURL(endpoint: "movie/now_playing?page=\(page)")
        case .popular(let page):
            NetworkHelper.shared.configureURL(endpoint: "movie/popular?page=\(page)")
        case .topRated(let page):
            NetworkHelper.shared.configureURL(endpoint: "movie/top_rated?page=\(page)")
        case .upcoming(let page):
            NetworkHelper.shared.configureURL(endpoint: "movie/upcoming?page=\(page)")
        }
        
        
    }
}
