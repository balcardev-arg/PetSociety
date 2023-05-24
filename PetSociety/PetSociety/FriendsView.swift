//
//  FriendsView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/05/2023.
//

import SwiftUI

struct FriendsView: View {
    @State var users: [User]
    var body: some View {
        ZStack {
            ColorExtensionView()
            List(users) { user in
                FriendCellView(user: user).listRowSeparator(.hidden)
            }
            .listStyle(.grouped)
            .colorMultiply(Color("backgroundColor"))
            .scrollContentBackground(.hidden)
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    @State static var user: [User] = [
        User(name: "Leonardo da Michi", email: "test@test.com", imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: true),
        User(name: "Michi Angelo", email: "test1@test.com", imageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: false),
        User(name: "El cochinote", email: "test2@test.com", imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: true),
        User(name: "Lucy Loles", email: "test3@test.com", imageUrl: "https://pub-static.fotor.com/assets/projects/pages/d5bdd0513a0740a8a38752dbc32586d0/fotor-03d1a91a0cec4542927f53c87e0599f6.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: false),
    ]
    static var previews: some View {
        FriendsView(users: user)
    }
}
