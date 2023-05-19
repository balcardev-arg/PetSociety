//
//  Notification.swift
//  PetSociety
//
//  Created by Layla Cisneros on 28/04/2023.
//

import Foundation

enum NotificationType: Codable {
    case post
    case profile
}

struct Notification: Codable, Identifiable {
    let id: String
    let postId: String
    let message: String
    let imageUrl: String
    let type: NotificationType
}
