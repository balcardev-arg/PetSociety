//
//  HomeView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 29/03/2023.
//

import SwiftUI

struct Post: Identifiable {
    let id: Int
    let title: String
    let image: String
}

let posts = [
    Post(id:1, title: "Laptop", image: "photo"),
    Post(id:2, title: "Mac mini", image: "photo"),
    Post(id:3, title: "Apple TV", image: "photo"),
    Post(id:4, title: "Laptop", image: "photo"),
    Post(id:5, title: "Mac mini", image: "photo"),
    Post(id:6, title: "Apple TV", image: "photo"),
    Post(id:7, title: "Laptop", image: "photo"),
    Post(id:8, title: "Mac mini", image: "photo"),
    Post(id:81, title: "Apple TV", image: "photo"),
    Post(id:11, title: "Laptop", image: "photo"),
    Post(id:12, title: "Mac mini", image: "photo"),
    Post(id:13, title: "Apple TV", image: "photo"),
    Post(id:14, title: "Laptop", image: "photo"),
    Post(id:122, title: "Mac mini", image: "photo"),
    Post(id:144, title: "Apple TV", image: "photo"),
    Post(id:551, title: "Laptop", image: "photo"),
    Post(id:61, title: "Mac mini", image: "photo"),
    Post(id:71, title: "Apple TV", image: "photo"),
]

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack() {
                ColorExtensionView()
                List(posts) { post in
                    Label(post.title, systemImage: post.image)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.automatic)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill").foregroundColor(.black)
                        }
                    }
                    ToolbarItem {
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass").foregroundColor(.black)
                        }
                    }
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color("backgroundColor"), for: .navigationBar)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
