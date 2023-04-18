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
