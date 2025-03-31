//
//  FirestoreManager.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 10.03.25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()
    
    private let db = Firestore.firestore()
    
    private init() {}
    
    func saveMovie(movie: MovieResult, completion: @escaping((String?) -> Void)) {
        let data: [String: Any] = ["movieId": movie.id ?? 0,
                                   "name": movie.titleText,
                                   "poster": movie.imageURL]
        guard let collection = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        db.collection(collection).document("\(movie.id ?? 0)").setData(data) {error in
            if let error {
                completion(error.localizedDescription)
            } else {
                completion(nil)
            }
        }
    }
}
