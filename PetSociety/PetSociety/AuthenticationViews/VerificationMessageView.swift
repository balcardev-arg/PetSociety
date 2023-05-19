//
//  VerificationMessageView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 05/04/2023.
//

import SwiftUI

struct VerificationMessageView: View {
    @Binding var navigationStackViews: [LoginNavigationViews]
    @State var message: String
    
    
    var body: some View {
        ZStack {
            ColorExtensionView()
            VStack {
                Text(message)
                    .bold()
                    .font(.system(size: 40))
                    .padding(20)
                Spacer()
                Button("Ok") {
                    navigationStackViews.removeAll()
                }.frame(width: 60,height: 40)
                    .bold()
                    .foregroundColor(.white)
                    .background(.pink)
                    .cornerRadius(10)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct EmailVerificationView_Previews: PreviewProvider {
    @State static var fakeStack: [LoginNavigationViews] = [.signUp, .emailVerification]
    static var previews: some View {
        VerificationMessageView(navigationStackViews: $fakeStack, message: "Please check your email for verification")
    }
}
