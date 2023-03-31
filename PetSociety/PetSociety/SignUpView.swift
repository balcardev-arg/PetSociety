//
//  SignUpView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//

import SwiftUI
import PhotosUI
import FirebaseStorage


struct SignUpView: View {
    
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
        let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/users")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        isLoading = true
        let userDictionary = [
            "name": name,
            "email": email,
            "password": password,
        ]
        
        request.httpBody = try? JSONEncoder().encode(userDictionary)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                // some error
                isLoading = false
                return
            }
            if httpResponse.statusCode == 200 {
                guard let data = data,
                      //TODO
                      let user = try? JSONDecoder().decode(User.self, from: data)
                else {
                    // some error
                    isLoading = false
                    return
                }
                uploadImage(for: user)
            }
        }.resume()
    }
    
    private func uploadImage(for user: User){
        // Creo una referencia a storage
        let storageReference = Storage.storage().reference()
        
        // guardo en data la imagen que se selecciona en el photopicker
        let data = photoPicker.imageData
        
        // a mi referencia de la imagen le digo en donde guardarse
        let imageReference = storageReference.child("\(user.id)/profilePicture.jpg")
        
        // le aplico putData para que me traiga metadata y error
        imageReference.putData(data) { metadata, error in
            
            // si la image trae metadata se le aplica downloadURL para que traiga URL o error
            guard let _ = metadata else {
                isLogged = true
                
                return
            }
            
            // si trae url se guarda como parametro en la funcion uploadProfileImage
            imageReference.downloadURL { (url, error) in
                guard let imageURL = url else {
                    isLogged = true
                    return
                }
                
                uploadProfileImage(with: imageURL.absoluteString, user: user)
            }
        }
        // En los errores, si no se pudo crear la imagen o si no se obtuvo la url, el usuario igualmente se puede loguear
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
        isLoading = true
        request.httpBody = try? JSONEncoder().encode(userDictionary)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            isLoading = false
            isLogged = true
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
