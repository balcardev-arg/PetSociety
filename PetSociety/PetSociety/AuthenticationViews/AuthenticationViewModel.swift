//
//  AuthenticationViewModel.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 29/03/2023.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var messageError: String?
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
    }
    
    func createNewUser(email: String, password: String) {
        authenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case.success(let user):
                self?.user = user
                
            case.failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    func login(email: String, password: String) {
        authenticationRepository.login(email: email, password: password) { [weak self] result in
            switch result {
            case.success(let user):
                self?.user = user
                
            case.failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
}
