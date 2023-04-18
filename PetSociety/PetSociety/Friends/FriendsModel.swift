//
//  FriendsModel.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 17/04/2023.
//

import SwiftUI

struct FriendsModel: View {
    @Binding var friends: [User]
        @State var friend: User
    
    var body: some View {

        NavigationLink(destination: FriendsView()) {
            HStack {
                AsyncImage(url: URL(string: friend.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                    } else {
                        ProgressView()
                    }
                }
                Text(friend.name)
                    .foregroundColor(.black)
                    .padding(10)
            }
        }
    }
}

struct FriendsModel_Previews: PreviewProvider {
    @State static var friend : [User] = []
    static var previews: some View {
        FriendsModel(friends: $friend, friend: User(name: "", email: "", imageUrl: ""))
    }
}
