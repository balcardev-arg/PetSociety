//
//  SignInView.swift
//  PetSociety
//
//  Created by Gian Lopez on 22/03/2023.
//


import SwiftUI

struct SignInView: View {
    
    @Binding var navigationStackViews: [LoginNavigationViews]
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    @State private var isPasswordSecure: Bool = true
    @State private var passwordIsVisible = false
    @State private var showingErrorAlert = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationView(){
            ZStack {
                ColorExtensionView()
                VStack (spacing: 30){
                    Image(systemName: "shazam.logo")
                        .resizable()
                        .frame(width: 160, height: 160)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.gray)))
                        .foregroundColor(.pink)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Sign In")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        Text("Email")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                        
                        TextField("name@example.com", text: $email)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                        
                        Text("Password")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                    }
                    HStack () {
                        if self.passwordIsVisible {
                            TextField("Password", text: $password)
                                .textInputAutocapitalization(.never)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button (action: {
                            self.passwordIsVisible.toggle()
                        }) {
                            Image(systemName: self.passwordIsVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                        .background(Color.white)
                        .frame(width: 350,height: 50)
                    
                    let validFields = self.email.isValidEmail() && self.password.isValidPassword()
                    
                    Button("Sign in") {
                        authenticationViewModel.login(email: email, password: password)
                    }.foregroundColor(.white)
                        .frame(width: 300,height: 50)
                        .background(validFields ? .pink : .gray)
                        .cornerRadius(10)
                        .disabled(!validFields)
                    if let messageError = authenticationViewModel.messageError {
                        Text(messageError)
                            .bold()
                            .font(.body)
                            .foregroundColor(.red)
                            .padding(.top, 20)
                    }
                    HStack {
                        Button("Forgot Password?"){
                            navigationStackViews.append(.forgotPassword)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        Button("Sign up"){
                            navigationStackViews.append(.signUp)
                            print(navigationStackViews)
                        }.padding()
                    }
                    Spacer()
                }
                .padding()
                
                .overlay {
                    if isLoading {
                        ProgressView()
                    }
                }
            }
        }
    }
    
    private func loginUser() {
        
        let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/users/login")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let userDictionary = [
            "email": email,
            "password": password
        ]
        request.httpBody = try? JSONEncoder().encode(userDictionary)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let _ = try? JSONDecoder().decode(User.self, from: data)
            else {
                print("usuario no encontrado")
                return
                
            }
            if let error = error {
                print("error; \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                }else {
                    print("error de carga")
                }
                
            }
            
        }.resume()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    @State static var fakeNavigationStackViews = [LoginNavigationViews]()
    static var previews: some View {
        SignInView(navigationStackViews: $fakeNavigationStackViews , authenticationViewModel: AuthenticationViewModel())
        
    }
}


