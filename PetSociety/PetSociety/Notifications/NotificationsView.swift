//
//  NotificationView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 27/04/2023.
//

import SwiftUI

struct NotificationsView: View {
    @State var notifications: [Notification]
    @State var user: User
    @State var users: [User]
    @State var posts: [Post]
    
    var body: some View {
        NavigationView{
            ZStack {
                ColorExtensionView()
                List(notifications) { notification in
                    NotificationCell(notification: notification, user: user, users: users, posts: posts)
                        .listRowSeparator(.hidden)
                        .foregroundColor(.black)
                }
                .colorMultiply(Color("backgroundColor"))
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    @State static var notification: [Notification] = [
        Notification(id: "1231223",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "1231223",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "1231231",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post)]
    @State static var user: User = User(name: "", email: "", imageUrl: "", isFriend: true)
    @State static var users: [User] = []
    @State static var posts: [Post] = []
    
    static var previews: some View {
        NotificationsView(notifications: notification, user: user, users: users, posts: posts)
    }
}
