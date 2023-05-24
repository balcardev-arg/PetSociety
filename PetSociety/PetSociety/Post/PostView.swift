//
//  PostView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 13/04/2023.
//

import SwiftUI

struct PostView: View {
    let postId: String
    @State private var post: Post?
    
    var body: some View {
        if let post = post {
            GeometryReader { proxy in
                ScrollView() {
                    VStack (alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: post.authorImageUrl)!) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                                } else {
                                    ProgressView().scaleEffect(4)
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
                                    .scaledToFill()
                            } else {
                                ProgressView()
                                    .scaleEffect(3)
                            }
                        }
                        .frame(width: proxy.size.width,
                               height: proxy.size.height * 0.50)
                        
                        Text("\(post.createdAt.timeSince())").padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
                        
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
        } else {
            ModalProgressView()
                .onAppear(){
                    getPost(with: postId)
                }
        }
    }
    
    private func getPost(with id: String) {
        WebService().getPost(with: id) { result in
            switch result {
            case .success(let post):
                self.post = post
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postId: "1")
    }
}
