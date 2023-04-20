//
//  AuthenticationFirebaseDatasource.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 29/03/2023.
//

import Foundation
import FirebaseAuth


final class AutheticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return User(name: user.displayName ?? "", email: user.uid, imageUrl: user.photoURL?.absoluteString ?? "")
    }
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>)-> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error creating a new user\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            guard let user = AuthDataResult?.user else {
                return
            }

            completionBlock(.success(User(name: user.displayName ?? "", email: user.uid, imageUrl: user.photoURL?.absoluteString ?? "")))
        
        }
    }
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>)-> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error Login\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            guard let user = AuthDataResult?.user else {
                return
            }

            completionBlock(.success(User(name: user.displayName ?? "", email: user.uid, imageUrl: user.photoURL?.absoluteString ?? "")))
        
        }
    }
}
