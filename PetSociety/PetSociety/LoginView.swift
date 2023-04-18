//
//  LoginView.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 03/04/2023.
//

import SwiftUI

struct LoginView: View {
    @AppStorage ("estaLogueado") var estaLogueado: Bool = false
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        TextField("Email", text: $email)
        TextField("Password", text: $password)
        Button("Login") {
            //llamas a backend con user y email
            //backend te devuelve un token de autenticacion
            estaLogueado = true
            //login
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
