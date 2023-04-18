//
//  PetSocietyApp.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//

import SwiftUI
import Firebase

@main
struct PetSocietyApp: App {
    
    private let posts = [
        Post(id: "1", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "10", text: "If you wanna run away with me, I know a galaxy and I can take you for a rideI had a premonition that we fell into a rhythm where the music don't stop for life", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ]),
        Post(id: "2", author: "Lay", authorImageUrl: "https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg", createdAt: Date(), imageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", likes: "6", text: "Common love isn't for us we created something phenomenal. Don't you agree?, Don't you agree?. You got me feeling diamond rich Nothing on this planet compares to it. Don't you agree?, Don't you agree?", comments:
                [
                    Comment(id: "1", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "2", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date()),
                    Comment(id: "3", author: "tu vieja", authorImageUrl: "https://www.feelcats.com/wp-content/uploads/2019/03/gatitos.jpg", comment: "hola, soy tu vieja", createdAt: Date())
                ])
    ]
    
    init() {
        FirebaseApp.configure()
        setNavigationViewAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInViewFake()
        }
    }
    
    private func setNavigationViewAppearance() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(hex: "#e4f5ff")
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
