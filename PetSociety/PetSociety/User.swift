//
//  User.swift
//  PetSociety
//
//  Created by Layla Cisneros on 28/03/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let imageUrl: String
    let isFriend: Bool
    let isPrivate: Bool
}
