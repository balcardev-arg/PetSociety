//
//  SignInView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//


import SwiftUI

struct SignInView: View {
    
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
                Color(red:229.0/255.0 , green: 243.0/255.0, blue: 254.0/255.0)
                    .ignoresSafeArea(.all)
                VStack(spacing: 20.0) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.gray)))
                        .shadow(radius:2)
                    
                    Text("Sign in")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        
                    
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 380)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Text("Password")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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
                        .background(Color.black.opacity(0.05))
                        .frame(width: 380)
                    
                    let validFields = self.email.isValidEmailAddress() && self.password.isPassword()
                    
                    Button("Sign in"){
                        loginUser()
                    }.foregroundColor(.white)
                        .frame(width: 300,height: 50)
                        .background(validFields ? .green : .pink)
                        .cornerRadius(25)
                        .disabled(!validFields)
                    
                    HStack {
                        Button("Forgot Password?"){
                            showForgotPasswordView = true
                        }
                        .sheet(isPresented: $showForgotPasswordView){
                            ZStack{
                                Color.white.ignoresSafeArea()
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Text("Sign Up")
                            .bold()
                            .padding()
                            .foregroundColor(Color .pink)
                    }
                    
                   
                }

                .padding()
                
                .overlay {
                    if isLoading {
                        ProgressView()
                    }
            }
            }
        }
        .background(Color(red: 229.0/255.0, green: 243.0/255.0, blue: 254.0/255.0))
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
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
             SignInView()        }
    }
    
}
