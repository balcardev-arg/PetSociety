//
//  Post.swift
//  PetSociety
//
//  Created by Layla Cisneros on 06/04/2023.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: String
    let author: String
    let authorImageUrl: String
    let createdAt: Date
    let imageUrl: String
    let likes: String
    let text: String
    let comments: [Comment]
}

struct Comment: Decodable, Identifiable, Hashable {
    let id: String
    let author: String
    let authorImageUrl: String
    let comment: String
    let createdAt: Date
}
