//
//  MovieEndpoint.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 18.02.25.
//

import Foundation

enum MovieEndpoint:String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
    
    var path: String {
//        switch self {
//        case .nowPlaying:
//            
//        case .popular:
//            
//        case .topRated:
//            
//        case .upcoming:
//
//        }
        
        NetworkHelper.shared.configureURL(endpoint: self.rawValue)
    }
}
