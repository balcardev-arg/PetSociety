//
//  NotificationView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 27/04/2023.
//

import SwiftUI

struct NotificationsView: View {
    @State var notifications: [Notification] = [
        Notification(id: "1",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post),
        Notification(id: "2",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "3",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post)]
    
    var body: some View {
        NavigationView{
            ZStack {
                ColorExtensionView()
                List(notifications) { notification in
                    NotificationCell(notification: notification)
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
        Notification(id: "123123123",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post),
        Notification(id: "123123123",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .profile),
        Notification(id: "123123123",
                     postId: "asdasdasd",
                     message: "elCochinote started following you.",
                     imageUrl: "https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300",
                     type: .post)]
    
    static var previews: some View {
        NotificationsView(notifications: notification)
    }
}
