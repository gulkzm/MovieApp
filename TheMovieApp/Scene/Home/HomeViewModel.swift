//
//  HomeViewModel.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 05.02.25.
//

import Foundation

struct HomeModel {
    let title: String
    let items: [MovieResult]
}

class HomeViewModel {
//    var movie: Movie?
    var movieItems = [HomeModel]()
    
    let manager = NetworkManager()
    
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllData() {
        getPopular()
        getTopRated()
        getNowPlaying()
        getUpcoming()
    }
    
    private func getNowPlaying() {
//        let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.nowPlaying.rawValue)
        let path = MovieEndpoint.nowPlaying.path
        manager.request(path: path,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movie = data
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: "Now Playing",
                                             items: data.results ?? []))
                self.success?()
            }
        }
    }
    
   private func getPopular() {
//       let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.popular.rawValue)
       let path = MovieEndpoint.popular.path
       manager.request(path: path,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: "Popular",
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
    private func getTopRated() {
//        let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.topRated.rawValue)
        let path = MovieEndpoint.topRated.path
        manager.request(path: path,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: "Top Rated",
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
    private func getUpcoming() {
//        let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.upcoming.rawValue)
        let path = MovieEndpoint.upcoming.path
        manager.request(path: path,
                        model: Movie.self) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: "Upcoming",
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
}
