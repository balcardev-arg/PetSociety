//
//  CommentView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 13/04/2023.
//

import SwiftUI

struct CommentView: View {
    @State var comment: Comment
    
    var body: some View {
        ZStack{
            VStack (alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: comment.authorImageUrl)!) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(.gray), lineWidth: 1))
                        } else {
                            ProgressView()
                        }
                    }
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .frame(width: 40, height: 40)
                    Text(comment.author)
                        .fontWeight(.bold)
                }
                Text(comment.comment)
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 10))
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment(id: "1", author: "Lay Cisneros", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "Hoy me puse linda para verte Y tú que estás con suerte No quiero tequila quiero a ese Y yo ni sé qué tiene se linda para verte Y tú que estás con suerte No quiero tequila quiero a ese", createdAt: Date()))
    }
}
