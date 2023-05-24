//
//  NetworkManager.swift
//  PetSociety
//
//  Created by Layla Cisneros on 04/04/2023.
//

import Foundation
import FirebaseStorage

// Struct para recibir el token
struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class WebService {
    
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "signUpUrl") else { return }
        let userDictionary = [
            "username": username,
            "email": email,
            "password": password,
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(userDictionary)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }.resume()
    }
    
    func updateProfile(imageUrl: String, completion: @escaping (Result<Void, Error>) -> Void){
        guard let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/users/profile") else { return }
        
        let imageDictionary = ["imageURL": imageUrl]
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(imageDictionary)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }.resume()
    }
    
    func uploadProfileImage(imageData: Data, userId: String, completion: @escaping (Result<String, Error>) -> Void ) {
        uploadImage(imageData: imageData, path: "\(userId)/profilePicture.jpg", completion: completion)
    }
    
    func uploadPostImage(imageData: Data, userId: String, completion: @escaping (Result<String, Error>) -> Void ) {
        uploadImage(imageData: imageData, path: "\(userId)/\(Date())", completion: completion)
    }
    
    private func uploadImage(imageData: Data, path: String, completion: @escaping (Result<String, Error>) -> Void ) {
        // Creo una referencia a storage
        let storageReference = Storage.storage().reference()
        
        // guardo en data la imagen que se selecciona en el photopicker
        let data = imageData
        
        // a mi referencia de la imagen le digo en donde guardarse
        let imageReference = storageReference.child(path)
        
        // le aplico putData para que me traiga metadata y error
        imageReference.putData(data) { metadata, error in
            
            // si la image trae metadata se le aplica downloadURL para que traiga URL o error
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            // si trae url convierte esa imagen en una url string
            imageReference.downloadURL { (url, error) in
                guard let imageURL = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(imageURL.absoluteString))
            }
        }
        // En los errores, si no se pudo crear la imagen o si no se obtuvo la url, el usuario igualmente se puede loguear
    }
    
    func getPosts(completion: @escaping (Result < [Post], Error >) -> Void) {
        guard let url = URL(string: "getPosts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  let userPosts = try? JSONDecoder().decode([Post].self, from: data) else { return }
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(userPosts))
            }
        }.resume()
    }
    
    func getPost(with id: String, completion: @escaping (Result <Post, Error>) -> Void) {
        guard let url = URL(string: "getPostId") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  let post = try? JSONDecoder().decode(Post.self, from: data) else { return }
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(post))
            }
        }.resume()
    }
    
    func followFriend(follow: Bool, friendId: String, completion: @escaping (Result <Void, Error>) -> Void) {
        guard let url = URL(string: "followFriend") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
            
        }
    }
}
