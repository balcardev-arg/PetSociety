//
//  AuthenticationRepository.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 29/03/2023.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource: AutheticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AutheticationFirebaseDatasource = AutheticationFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    func getCurrentUser() -> Users? {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<Users, Error>) -> Void) {
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    func login(email: String, password: String, completionBlock: @escaping (Result<Users, Error>) -> Void) {
        authenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }
}
