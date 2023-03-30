//
//  PetSocietyApp.swift
//  PetSociety
//
//  Created by Layla Cisneros on 22/03/2023.
//

import SwiftUI
import Firebase

class appDelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) ->Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct PetSocietyApp: App {
    @UIApplicationDelegateAdaptor(appDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let users = authenticationViewModel.user {
                Text("Usuario lageado \(users.email)")
            } else {
                SignInView(authenticationViewModel: authenticationViewModel)
            }
            
        }
    }
}
