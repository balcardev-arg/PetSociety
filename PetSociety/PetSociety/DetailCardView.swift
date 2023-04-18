//
//  DetailCardView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 12/04/2023.
//

import SwiftUI

struct DetailCardView: View {
    @State var post: Post
    
    var body: some View {
        ZStack {
            ColorExtensionView()
            VStack {
                PostView(post: post)
            }
        }
    }
}


struct DetailCardView_Previews: PreviewProvider {
    static var post = Post(id: "1", author: "Lay Cisneros", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                            [
                                Comment(id: "1", author: "Dua Lipa", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "Show me that heaven's right here, baby Touch me, so I know I'm not crazy Never have I ever met somebody like you Used to be afraid of love and what it might do But goddamn, you got me in love again", createdAt: Date()),
                                Comment(id: "2", author: "Tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "chau, yo era tu mama pero ahora estoy muerta.", createdAt: Date())
                            ])
    
    static var previews: some View {
        DetailCardView(post: post)
    }
}
