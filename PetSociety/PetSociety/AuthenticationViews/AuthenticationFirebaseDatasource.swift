//
//  AuthenticationFirebaseDatasource.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 29/03/2023.
//

import Foundation
import FirebaseAuth

final class AutheticationFirebaseDatasource {
     
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>)-> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error creating a new user\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("New user created with info\(email)")
            completionBlock(.success(User(id: "1", name: "", email: "", password: "", imageUrl: "")))
        
        }
    }
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>)-> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, error in
            if let error = error {
                print("Error Login\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("User login\(email)")
            completionBlock(.success(User(id: "1",name: "", email: "", password: "", imageUrl: "")))
        
        }
    }
}
