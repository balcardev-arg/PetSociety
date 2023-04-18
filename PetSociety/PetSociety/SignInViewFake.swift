//
//  SignInViewFake.swift
//  PetSociety
//
//  Created by Layla Cisneros on 05/04/2023.
//

import SwiftUI

enum LoginNavigationViews: String, Hashable {
    case signUp
    case emailVerification
    case forgotPassword
}

struct SignInViewFake: View {
    @State var navigationStackViews: [LoginNavigationViews] = []
    
    var body: some View {
        NavigationStack(path: $navigationStackViews) {
            Button("SignUp") {
                navigationStackViews.append(.signUp)
            }
            Button("Forgot Password") {
                navigationStackViews.append(.forgotPassword)
            }
            .navigationDestination(for: LoginNavigationViews.self){ destination in
                switch destination {
                case .signUp:
                    SignUpView(navigationStackViews: $navigationStackViews)
                case .emailVerification:
                    EmailVerificationView(navigationStackViews: $navigationStackViews)
                case .forgotPassword:
                    ForgotPasswordView()
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewFake()
    }
}
