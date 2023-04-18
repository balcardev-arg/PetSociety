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
                    PostCell(post: post).listRowSeparator(.hidden)
                }.padding(-20)
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
      //  .onAppear{
      //      getPosts()
      //  }
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
        Post(id: "1", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ]),
        Post(id: "2", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ]),
        Post(id: "3", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.divinacocina.es/wp-content/uploads/2016/01/huevos-revueltos-desayuno-2.jpg", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ])
    ]
    static var previews: some View {
        HomeView(posts: posts)
    }
}
