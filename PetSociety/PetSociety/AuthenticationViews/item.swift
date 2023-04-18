//
//  item.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 18/04/2023.
//

import Foundation
struct Item : Identifiable, Codable {
    let id: String
    let url: String
    let imageUrl: String
    let authorId: String
    let description: String
}

extension Item: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
