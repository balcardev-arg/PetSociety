//
//  Comment.swift
//  PetSociety
//
//  Created by Layla Cisneros on 18/05/2023.
//

import Foundation

struct Comment: Decodable, Identifiable, Hashable {
    let id: String
    let author: String
    let authorImageUrl: String
    let comment: String
    let createdAt: Date
}
