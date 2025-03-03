//
//  ActorViewModel.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 16.02.25.
//

import Foundation

class ActorViewModel {
    var actor: Actor?
    var items = [ActorData]()
    let manager = ActorManager()
//    let manager = ActorMockManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getActorList() {
//        let path = NetworkHelper.shared.configureURL(endpoint:ActorEndpoint.actor.rawValue)
//        manager.request(path: path,
//                        model: Actor.self) { data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.items = data.results ?? []
//                self.success?()
//            }
//        }
        print("page: \(actor?.page ?? -1)")
        manager.getActorList (page: (actor?.page ?? 0) + 1){ data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.actor = data
//                self.items = data.results ?? []
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == items.count-2 && (actor?.page ?? 0 <= actor?.totalPages ?? 0) {
            getActorList()
        }
    }
    
    func reset() {
        actor = nil
        items.removeAll()
    }
}
