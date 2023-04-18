//
//  HomeView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 29/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var posts: [Post]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ColorExtensionView()
                List(posts) { post in
                    HStack (alignment: .top){
                        AsyncImage(url: URL(string: post.authorImageUrl)!) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                            } else {
                                ProgressView()
                            }
                        }
                        VStack (alignment: .leading){
                            Text("\(post.author)")
                            Text("\(post.createdAt.timeSince())")
                        }
                    }
                    .listRowSeparator(.hidden)
                    Image(systemName: "photo")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.width)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom){
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray.opacity(0.8))
                                .frame(width: 355, height: 90)
                            VStack(alignment: .leading){
                                HStack(alignment: .top){
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                    Text("\(post.likes)")
                                        .foregroundColor(.white)
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.pink)
                                    Text("\(post.comments.count)")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                Text("\(post.text)").lineLimit(3)
                                    .foregroundColor(.white)
                            }
                        }
                }
                .colorMultiply(Color("backgroundColor"))
                .scrollContentBackground(.hidden)
                .listStyle(.grouped)
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
        .onAppear{
            getPosts()
        }
    }
    
    private func getPosts() {
        WebService().getPosts() { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let posts):
                self.posts = posts
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var posts = [
        Post(id: "1", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                [
                    Comment(id: "1", author: "tu vieja", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", comment: "hola, soy tu vieja", createdAt: Date())
                ]),
        Post(id: "2", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", comment: "hola, soy tu vieja", createdAt: Date())
                ])
    ]
    static var previews: some View {
        HomeView(posts: posts)
    }
}
