//
//  EmailVerificationView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 05/04/2023.
//

import SwiftUI

struct EmailVerificationView: View {
    @Binding var navigationStackViews: [LoginNavigationViews]
    
    var body: some View {
        ZStack {
            ColorExtensionView()
            VStack {
                Text("Please check your email for verification")
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
        EmailVerificationView(navigationStackViews: $fakeStack )
    }
}
