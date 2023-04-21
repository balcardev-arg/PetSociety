//
//  ForgotPasswordView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 05/04/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var navigationStackViews: [LoginNavigationViews]
    @State var email: String = ""
    
    var body: some View {
        ZStack {
            ColorExtensionView()
            VStack(alignment: .leading) {
                Text("Enter your email to reset password")
                    .bold()
                    .font(.system(size: 18))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                Text("Email")
                    .bold()
                TextField("name@example.com", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                Button("Reset password") {
                    navigationStackViews.append(.resetPasswordVerification)
                }
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.pink)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    @State static var fakeNavigationStackViews = [LoginNavigationViews]()
    static var previews: some View {
        ForgotPasswordView(navigationStackViews: $fakeNavigationStackViews)
    }
}
