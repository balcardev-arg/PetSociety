//
//  PostCell.swift
//  PetSociety
//
//  Created by Layla Cisneros on 13/04/2023.
//

import SwiftUI

struct PostCell: View {
    @State var post: Post
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                
                HStack {
                    AsyncImage(url: URL(string: post.authorImageUrl)!) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                        } else {
                            ProgressView()
                        }
                    }
                    VStack (alignment: .leading){
                        Text("\(post.author)").foregroundColor(.black)
                        Text("\(post.createdAt.timeSince())").foregroundColor(.black)
                    }
                }
                
                
                ZStack(alignment: .bottom) {
                    if let imageUrl = URL(string: post.imageUrl) {
                        AsyncImage(url: imageUrl) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
//                                    .frame(height: UIScreen.main.bounds.width - 20)
//                                    .frame(maxWidth: UIScreen.main.bounds.width - 20)
                                    .scaledToFit()
                                    .frame(width: 400, height: 300)
                                    .foregroundColor(.black)
                            } else {
                                ProgressView()
                                    .frame(height: UIScreen.main.bounds.width)
                                    .frame(maxWidth: UIScreen.main.bounds.width)
                            }
                        }
                    }
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.gray.opacity(0.8))
                        .frame(height: 100)
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
            NavigationLink(destination: PostView(post: post)) {EmptyView()}.opacity(0)
        }
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(id: "1", author: "Lay Cisneros", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                            [
                                Comment(id: "1", author: "Dua Lipa", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "Show me that heaven's right here, baby Touch me, so I know I'm not crazy Never have I ever met somebody like you Used to be afraid of love and what it might do But goddamn, you got me in love again", createdAt: Date()),
                                Comment(id: "2", author: "Tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "chau, yo era tu mama pero ahora estoy muerta.", createdAt: Date())
                            ])
        PostCell(post: post)
    }
}
