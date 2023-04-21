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
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    init() {
        FirebaseApp.configure()
        setNavigationViewAppearance()
        setTabViewAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticationNavigatorView()
//            if authenticationViewModel.user != nil {
//                TabBar(authenticationViewModel: authenticationViewModel)
//                        } else {
//                            AuthenticationNavigatorView()
//                        }
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
    
    private func setTabViewAppearance() {
        let coloredAppearance = UITabBarAppearance()
        coloredAppearance.backgroundColor = .white
        coloredAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        coloredAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        coloredAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
        coloredAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemPink
        
        UITabBar.appearance().standardAppearance = coloredAppearance
        UITabBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
