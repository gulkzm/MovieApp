//
//  AuthManager.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 06.03.25.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()

    private init() {}
    
 //MARK: Authentication
    func enter(email: String, password: String, completion: @escaping (String?) -> Void) {
        if Auth.auth().currentUser == nil {
            signUp(email: email, password: password, completion: completion)
        } else {
            signIn(email: email, password: password, completion: completion)
        }
    }
    
    private func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    private func signUp(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error.localizedDescription)
            } else if let result = result {
                UserDefaults.standard.set(result.user.uid, forKey: "userId")
                completion(nil)
            }
        }
    }
    
    private func signIn(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error.localizedDescription)
            } else if let result = result {
                UserDefaults.standard.set(result.user.uid, forKey: "userId")
                completion(nil)
            }
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    //END
   
}
