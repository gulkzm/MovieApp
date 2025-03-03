//
//  ActorManager.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 24.02.25.
//

import Foundation

//protocol - UseCase
protocol ActorManagerUseCase {
    func searchActor()
    func getActorList(page: Int, completion: @escaping((Actor?, String?) -> Void))
    func getActorMovies(actorId: Int, completion: @escaping((Movie?, String?) -> Void))
}

extension ActorManagerUseCase {
    func searchActor() {}
}

class ActorManager: ActorManagerUseCase {
    let  manager = NetworkManager()
    
    func getActorList(page: Int, completion: @escaping((Actor?, String?) -> Void)) {
        let path = ActorEndpoint.actor(page: page).path
//        manager.request(path: path, model: Actor.self) { data, errorMessage in
//            if let errorMessage {
//                completion(nil, errorMessage)
//            } else if let data {
//                completion(data, nil)
//            }
//        } tekrar olur dete shortcut kimi ashagidaki kimi yaziriq
        manager.request(path: path, model: Actor.self, completion: completion)
    }
    
    func getActorMovies(actorId: Int, completion: @escaping((Movie?, String?) -> Void)) {
        let path = ActorEndpoint.actorMovies(id: actorId).path
        manager.request(path: path, model: Movie.self, completion: completion)
    }
}
