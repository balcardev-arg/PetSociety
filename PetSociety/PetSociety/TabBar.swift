//
//  TabBar.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 31/03/2023.
//

import SwiftUI

struct TabBar: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var user: User
    @State var users: [User]
    @State var posts: [Post]
    @State var notifications: [Notification]
    
    var body: some View {
        TabView {
            HomeView(posts: posts).tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Text("Messages")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Message")
                }
            Text("Toilet")
                .tabItem {
                    Image(systemName: "shuffle")
                    Text("Toilet")
                }
            NotificationsView(notifications: notifications, user: user, users: users, posts: posts).tabItem {
                Image(systemName: "bell.fill")
                Text("Notifications")
            }
            ProfileView(user: user, users: users, posts: posts).tabItem {
                if let user = AutheticationFirebaseDatasource().getCurrentUser() {
                    AsyncImage(url: URL(string: user.imageUrl))
                } else {
                    Image(systemName: "person.circle.fill")
                }
                Text("Profile")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    @State static var user: User = User(name: "Lay Cisneros", email: "test4@test.com", imageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", friends: [
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
        User(name: "", email: "", imageUrl: "", friends: [], isFriend: true),
    ], isFriend: false)
    
    @State static var users: [User] = [
        User(name: "Leonardo da Michi", email: "test@test.com", imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: true),
        User(name: "Michi Angelo", email: "test1@test.com", imageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: false),
        User(name: "El cochinote", email: "test2@test.com", imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: true),
        User(name: "Lucy Loles", email: "test3@test.com", imageUrl: "https://pub-static.fotor.com/assets/projects/pages/d5bdd0513a0740a8a38752dbc32586d0/fotor-03d1a91a0cec4542927f53c87e0599f6.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: false),

    ]
    
    @State static var posts: [Post] = [
        Post(id: "1", author: "Lay Cisneros", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ], commentCount: 10),
        Post(id: "2", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ], commentCount: 5),
        Post(id: "3", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.divinacocina.es/wp-content/uploads/2016/01/huevos-revueltos-desayuno-2.jpg", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ], commentCount: 2)
    ]
    @State static var notifications: [Notification] = [
        Notification(id: "1231223",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "1231223",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "1231231",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post)
    ]
    
    static var previews: some View {
        TabBar(authenticationViewModel: AuthenticationViewModel(), user: user, users: users, posts: posts, notifications: notifications)
    }
}
