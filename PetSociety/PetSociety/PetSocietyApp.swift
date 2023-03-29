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
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ColorExtensionView()
                SignUpView()
            }
        }
    }
}
