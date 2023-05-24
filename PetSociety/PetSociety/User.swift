//
//  User.swift
//  PetSociety
//
//  Created by Layla Cisneros on 28/03/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String {
        get {
            return email
        }
    }
    let name: String
    let email: String
    let imageUrl: String
    var friends: [User] = []
    var isFriend: Bool
}
