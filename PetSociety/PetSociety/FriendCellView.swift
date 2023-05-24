//
//  FriendCellView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/05/2023.
//

import SwiftUI

struct FriendCellView: View {
    @State var user: User
    
    var body: some View {
        if (user.isFriend) {
            HStack {
                AsyncImage(url: URL(string: user.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                    } else {
                        ProgressView().scaleEffect(2)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                }
                VStack (alignment: .leading){
                    Text("\(user.name)")
                        .bold()
                    Text("Already following")
                }
                Spacer()
                Button(action: {}) {
                    Text("Unfollow")
                        .frame(width: 100, height: 50)
                        .background(.pink)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
        } else {
            HStack {
                AsyncImage(url: URL(string: user.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                    } else {
                        ProgressView().scaleEffect(2)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                }
                VStack (alignment: .leading){
                    Text("\(user.name)")
                        .bold()
                    Text("Followed by Friend")
                }
                Spacer()
                Button(action: {}) {
                    Text("Unfollow")
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    @State static var user: User = User(name: "Leonardo da Michi", email: "", imageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", friends: [User(name: "", email: "", imageUrl: "", friends: [], isFriend: true)], isFriend: true)
    static var previews: some View {
        FriendCellView(user: user)
    }
}
