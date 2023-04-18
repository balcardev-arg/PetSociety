//
//  SignUpView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//

import SwiftUI
import PhotosUI

struct User: Codable {
    let name: String
    let email: String
    let password: String
}
struct SignUpView: View {
     @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @Binding var navigationStackViews: [LoginNavigationViews]
    
    @AppStorage("isLogged") var isLogged: Bool = false
    
    @StateObject var photoPicker: PhotoPicker = PhotoPicker()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation = ""
    @State private var name: String = ""
    @State private var displayName: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordConfirmationVisible: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack() {
            ColorExtensionView()
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
                        let samePassword = password == passwordConfirmation
                        let validFields = email.isValidEmail() && password.isValidPassword() && passwordConfirmation.isValidPassword() && samePassword && !name.isEmpty
                        
                        Button("Sign Up") {
                                authenticationViewModel.createNewUser(email: email, password: password)
                            }.frame(width: 300, height: 40)
                            .background(validFields ? Color.pink : Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                        if let messageError = authenticationViewModel.messageError {
                            Text(messageError)
                                .bold()
                                .font(.body)
                                .foregroundColor(.red)
                                .padding(.top, 20)
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
            if isLoading {
                ModalProgressView()
            }
        }
    }
    
    private func postUser(){
        isLoading = true
        WebService().signUp(username: name, email: email, password: password) { result in
            switch result {
            case .success():
                uploadImage(for: email)
            case .failure(_):
                isLoading = false
                //mostrar un error
            }
        }
    }
    
    private func uploadImage(for email: String){
        let data = photoPicker.imageData
        WebService().uploadImage(imageData: data) { result in
            switch result {
            case .success(let imageUrl):
                updateProfileImage(with: imageUrl)
            case .failure(_):
                isLoading = false
                //mostrar un error
            }
        }
    }
    
    private func updateProfileImage(with imageUrl: String){
        WebService().updateProfile(imageUrl: imageUrl) { result in
            isLoading = false
            switch result {
            case .success():
                navigationStackViews.append(.emailVerification)
            case .failure(let error):
                print (error)
                //mostrar un error
            }   
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    @State static var fakeStack: [LoginNavigationViews] = [.signUp, .emailVerification]
    static var previews: some View {
        SignUpView(navigationStackViews: $fakeStack)
    }
}
