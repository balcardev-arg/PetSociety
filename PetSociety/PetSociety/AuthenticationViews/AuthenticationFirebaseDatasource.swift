//
//  AuthenticationFirebaseDatasource.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 29/03/2023.
//

import Foundation
import FirebaseAuth

struct Users {
    let email: String
}

final class AutheticationFirebaseDatasource {
    func getCurrentUser() -> Users? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return.init(email: email)
    }
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<Users,Error>)-> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error creating a new user\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("New user created with info\(email)")
            completionBlock(.success(.init(email: email)))
        
        }
    }
    func login(email: String, password: String, completionBlock: @escaping (Result<Users,Error>)-> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error Login\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("User login\(email)")
            completionBlock(.success(.init(email: email)))
        
        }
    }
}
