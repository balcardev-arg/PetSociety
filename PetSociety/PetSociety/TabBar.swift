//
//  TabBar.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 31/03/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Messager")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Message")
                    
                }
            Text("Toilet")
                .tabItem {
                    Image(systemName: "toilet.fill")
                    Text("Toilet")
                }
            Text("Notification")
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notification")
                }
            Text("Perfil")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Perfil")
                }
        }
    }
}

public struct TabBar_Previews: PreviewProvider {
    public static var previews: some View {
        TabBar()
    }
}
