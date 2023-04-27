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
                                  //  .padding(10)
                            } else {
                                ProgressView()
                            }
                        }
                        VStack (alignment: .leading){
                            Text("\(post.author)").foregroundColor(.black)
                            Text("\(post.createdAt.timeSince())").foregroundColor(.black)
                        }
                    }.padding()
                    ZStack(alignment: .bottom) {
                        if let imageUrl = URL(string: post.imageUrl) {
                            AsyncImage(url: imageUrl) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 400, height: 400)
                                } else {
                                    ProgressView()
                                        .scaleEffect(3)
                                        .frame(width: .infinity, height: 350)
                                }
                            }
                        }
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray.opacity(0.8))
                            .frame(height: 105)
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
                        .padding()
                    }
                }
                NavigationLink(destination: PostView(post: post)) {EmptyView()}.opacity(0)
        }
//        .onTapGesture {
//            PostView(post: post)
//        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(id: "1", author: "Lay Cisneros", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life. Every time that I look in the mirrorAll these lines on my face getting clearerThe past is goneOh, it went by like dusk to dawnIsn't that the way?Everybody's got their dues in life to pay, oh, oh, ohI know nobody knowsWhere it comes and where it goesI know it's everybody's sinYou got to lose to know how to winHalf my life's in books' written pagesStoring facts learned from fools and from sagesYou view the earthOh, sing with me, this mournful dubSing with me, sing for a yearSing for the laughter, and sing for the tearSing with me, if it's just for todayMaybe tomorrow, the good Lord will take you awayOh, sing with me, sing for the yearSing for the laughter, and sing for the tearSing it with me, if it's just for todayMaybe tomorrow, the good Lord will take you away", comments:
                            [
                                Comment(id: "1", author: "Dua Lipa", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "Show me that heaven's right here, baby Touch me, so I know I'm not crazy Never have I ever met somebody like you Used to be afraid of love and what it might do But goddamn, you got me in love again", createdAt: Date()),
                                Comment(id: "2", author: "Tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "chau, yo era tu mama pero ahora estoy muerta.", createdAt: Date())
                            ])
        PostCell(post: post)
    }
}
