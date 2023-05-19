//
//  NotificationCell.swift
//  PetSociety
//
//  Created by Layla Cisneros on 16/05/2023.
//

import SwiftUI

struct NotificationCell: View {
    
    @State var notification: Notification
    
    var body: some View {
        
        let view: any View = notification.type == .post ? PostView(postId: notification.postId) : ProfileView()
        
        NavigationLink(destination: AnyView(view)) {
            if notification.type == .profile {
                HStack {
                    AsyncImage(url: URL(string: "\(notification.imageUrl)")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                    Text("\(notification.message)")
                        .foregroundColor(.black)
                }
            } else {
                    Image(systemName: "bell.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.cyan)
                    .background(.black)
                    .clipShape(Circle())
                    
                    Text("\(notification.message)")
                        .foregroundColor(.black)
            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    @State static var notification: Notification = Notification(id: "123123123", postId: "asdasdasd",
                                                                message: "elCochinote started following you.",
                                                                imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                                                                type: .post)
    
    static var previews: some View {
        NotificationCell(notification: notification)
    }
}
