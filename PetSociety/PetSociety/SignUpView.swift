//
//  SignUpView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    @StateObject var photoPicker: PhotoPicker = PhotoPicker()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation = ""
    @State private var name: String = ""
    @State private var displayName: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordConfirmationVisible: Bool = false
    
    var body: some View {
            ZStack{
                Color(red: 228/255, green: 245/255, blue: 254/255).ignoresSafeArea()
                VStack (alignment: .center){
                    photoPicker.image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .foregroundColor(Color.pink)
                        .padding(10)
                    
                    PhotosPicker(selection: $photoPicker.photoSelection, matching: .images, photoLibrary: .shared()) {
                        Text("Select image")}
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.bold)
                        TextField("name@example.com", text: $email)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                        Text("Password")
                            .fontWeight(.bold)
                        
                        HStack (spacing: -40){
                            if (isPasswordVisible) {
                                TextField("Password", text: $password)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.white)
                                    .textInputAutocapitalization(.never)
                            } else {
                                SecureField("Password", text: $password)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.white)
                            }
                            Button (action: {
                                self.isPasswordVisible.toggle()
                            })
                            { Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        Text("Password confirmation")
                            .fontWeight(.bold)
                        
                        HStack (spacing: -40) {
                            if (isPasswordConfirmationVisible) {
                                TextField("Password", text: $passwordConfirmation)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.white)
                                    .textInputAutocapitalization(.never)
                            } else {
                                SecureField("Password", text: $passwordConfirmation)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.white)
                            }
                            Button (action: {
                                self.isPasswordConfirmationVisible.toggle()
                            })
                            { Image(systemName: isPasswordConfirmationVisible ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        VStack (alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                                .frame(alignment: .trailing)
                            TextField("Sample name", text: $name)
                                .padding()
                                .frame(width: 350, height: 50)
                                .background(Color.white)
                            Text("Display name")
                                .fontWeight(.bold)
                            TextField("Sample display name", text: $displayName)
                                .padding()
                                .frame(width: 350, height: 50)
                                .background(Color.white)
                            Text("This will be defaulted to the name if none is provide")
                                .font(.footnote)
                                .foregroundColor(.red)
                            Spacer()
                        }
                        let samePassword = password == passwordConfirmation
                        
                        let validFields = self.email.isValidEmail() && self.password.isValidPassword() && self.passwordConfirmation.isValidPassword() && samePassword && !self.name.isEmpty && photoPicker.photoSelection != nil
                        
                        Button(action: postUser) {
                            Text ("Sign Up")
                        }.frame(width: 300, height: 40)
                            .background(validFields ? Color.pink : Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
    }
    
    private func postUser(){
        let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/users")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let userDictionary = [
            "name": name,
            "email": email,
            "password": password,
        ]
        
        request.httpBody = try? JSONEncoder().encode(userDictionary)
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                // some error
                return
            }
            if httpResponse.statusCode == 200 {
                guard let data = data,
                      //TODO
                      let _ = try? JSONDecoder().decode(User.self, from: data)
                else {
                    // some error
                    return
                }
            }
            
        }.resume()
    }
    
    private func uploadProfileImage(with imageUrl: String, user: User){
        let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/users/profile")
        let userDictionary = [
            "userId": user.id,
            "imageURL": imageUrl,
        ]
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(userDictionary)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                // some error
                return
            }
            if httpResponse.statusCode == 200 {
                guard let data = data,
                      let _ = try? JSONDecoder().decode(User.self, from: data) else {
                    // some error
                    return
                }
            }
        }.resume()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
