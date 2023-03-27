//
//  StringExtension.swift
//  PetSociety
//
//  Created by Layla Cisneros on 23/03/2023.
//

import Foundation

extension String {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> Bool {
        return self.count >= 6
    }
}
