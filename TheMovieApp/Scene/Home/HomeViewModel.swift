//
//  HomeViewModel.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 05.02.25.
//

import Foundation

enum HomeSectionTitle: String {
    case popular = "Popular"
    case upcoming = "Upcoming"
    case toprated = "Top Rated"
    case nowplaying = "Now Playing"
}

struct HomeTitleModel {
    let type: HomeSectionTitle
    let endpoint: MovieEndpoint
}

struct HomeModel {
    let title: HomeTitleModel
    var items: [MovieResult]
}

class HomeViewModel {
//    var movie: Movie?
    var movieItems = [HomeModel]()
    
    let manager = MovieManager()
    
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
//        let path = MovieEndpoint.nowPlaying.path
//        manager.request(path: path,
//                        model: Movie.self) { data, error in
        manager.getMovieList(page: 1, endpoint: .nowPlaying(page: 1)) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movie = data
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: .init(type: .nowplaying, endpoint: .nowPlaying(page: 1)),
                                             items: data.results ?? []))
                self.success?()
            }
        }
    }
    
   private func getPopular() {
//       let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.popular.rawValue)
//       let path = MovieEndpoint.popular.path
//       manager.request(path: path,
//                        model: Movie.self) { data, error in
       manager.getMovieList(page: 1, endpoint: .popular(page: 1)) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: .init(type: .popular, endpoint: .popular(page: 1)),
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
    private func getTopRated() {
//        let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.topRated.rawValue)
//        let path = MovieEndpoint.topRated.path
//        manager.request(path: path,
//                        model: Movie.self) { data, error in
        manager.getMovieList(page: 1, endpoint: .topRated(page: 1)) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: .init(type: .toprated, endpoint: .topRated(page: 1)),
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
    private func getUpcoming() {
//        let path = NetworkHelper.shared.configureURL(endpoint: MovieEndpoint.upcoming.rawValue)
//        let path = MovieEndpoint.upcoming.path
//        manager.request(path: path,
//                        model: Movie.self) { data, error in
        manager.getMovieList(page: 1, endpoint: .upcoming(page: 1)) { data, error in
            if let error {
                self.errorHandling?(error)
            } else if let data {
//                self.movieItems = data.results ?? []
                self.movieItems.append(.init(title: .init(type: .upcoming, endpoint: .upcoming(page: 1)),
                                             items: data.results ?? []))

                self.success?()
            }
        }
    }
    
}
