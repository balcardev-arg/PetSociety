//
//  ProfileView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 18/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var user: User
    @State var users: [User]
    @State var posts: [Post]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ColorExtensionView()
                VStack {
                    HStack{
                        AsyncImage(url: URL(string: user.imageUrl)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                            } else {
                                ProgressView().scaleEffect(2)
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                            }
                        }.padding()
                        VStack {
                            Text("\(user.name)")
                                .padding(5)
                            NavigationLink(destination: FriendsView(users: users)) {
                                Text("\(user.friends.count) \n Follows")
                                    .foregroundColor(.black)
                            }
                        }.bold()
                        VStack {
                            Button(action: {
                                WebService().followFriend(follow: !user.isFriend, friendId: user.id) { result in
                                    switch result {
                                    case .failure(let error):
                                        print(error)
                                    case .success():
                                        user.isFriend.toggle()
                                    }
                                }
                            }) {
                                if user.isFriend {
                                    Text("Unfollow")
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 30)
                                        .background(.pink)
                                        .cornerRadius(5)
                                } else {
                                    Text("Follow")
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 30)
                                        .background(.blue)
                                        .cornerRadius(5)
                                }
                            }
                            NavigationLink(destination: FriendsView(users: users)) {
                                Text("\(user.friends.count) \n Followers")
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                    .bold()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .padding(.top, 10)
                    
                    List(posts) { post in
                        PostCell(post: post).listRowSeparator(.hidden)
                    }
                    .padding(-10)
                    .colorMultiply(Color("backgroundColor"))
                    .scrollContentBackground(.hidden)
                    .listStyle(.automatic)
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State static var user: User = User(name: "Lay Cisneros", email: "", imageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", friends: [
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
                ], commentCount: 3)
    ]
    static var previews: some View {
        ProfileView(user: user, users: users, posts: posts)
    }
}
