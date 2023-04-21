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
    case resetPasswordVerification
}

struct AuthenticationNavigatorView: View {
    @State var navigationStackViews: [LoginNavigationViews] = []
    
    var body: some View {
        
        NavigationStack(path: $navigationStackViews) {
            SignInView(navigationStackViews: $navigationStackViews, authenticationViewModel: AuthenticationViewModel())
                .navigationDestination(for: LoginNavigationViews.self){ destination in
                    switch destination {
                    case .signUp:
                        SignUpView(navigationStackViews: $navigationStackViews)
                    case .emailVerification:
                        VerificationMessageView(navigationStackViews: $navigationStackViews, message: "Please check your email for verification")
                    case .resetPasswordVerification:
                        VerificationMessageView(navigationStackViews: $navigationStackViews, message: "Please check your email to continue the reset process")
                    case .forgotPassword:
                        ForgotPasswordView(navigationStackViews: $navigationStackViews)
                    }
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationNavigatorView()
    }
}
