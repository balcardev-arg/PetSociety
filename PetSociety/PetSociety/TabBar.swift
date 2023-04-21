//
//  TabBar.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 31/03/2023.
//

import SwiftUI

struct TabBar: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        TabView {
            HomeView().tabItem {
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
            Text("Notification")
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notification")
                }
            Text("Perfil")
                .tabItem {
                    
                    if let user = AutheticationFirebaseDatasource().getCurrentUser() {
                        AsyncImage(url: URL(string: user.imageUrl))
                    } else {
                        Image(systemName: "person.circle.fill")
                    }
                    Text("Perfil")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(authenticationViewModel: AuthenticationViewModel())
    }
}
