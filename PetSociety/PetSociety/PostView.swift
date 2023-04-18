//
//  PostView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 13/04/2023.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    
    var body: some View {
        ScrollView() {
            VStack (alignment: .leading) {
                HStack {
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
                            ProgressView().frame(width: 50, height: 50)
                        }
                    }.padding()
                    
                    Text("\(post.author)")
                        .font(.title)
                        .fontWeight(.bold)
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                AsyncImage(url: URL(string: post.imageUrl)!) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: .infinity, height: 400)
                            .aspectRatio(contentMode: .fill)
                    } else {
                        ProgressView()
                            .scaleEffect(3)
                            .frame(width: 400, height: 400)
                    }
                }
                
                Text("\(post.createdAt.timeSince())").padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                    Text("\(post.likes)")
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: -10, trailing: 0))
                
                Text("\(post.text)").padding(20)
                
                ForEach(post.comments, id: \.self) { comment in
                    CommentView(comment: comment).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var post = Post(id: "1", author: "Lay Cisneros", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                            [
                                Comment(id: "1", author: "Dua Lipa", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "Show me that heaven's right here, baby Touch me, so I know I'm not crazy Never have I ever met somebody like you Used to be afraid of love and what it might do But goddamn, you got me in love again", createdAt: Date()),
                                Comment(id: "2", author: "Tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "chau, yo era tu mama pero ahora estoy muerta.", createdAt: Date())
                            ])
    
    static var previews: some View {
        PostView(post: post)
    }
}
