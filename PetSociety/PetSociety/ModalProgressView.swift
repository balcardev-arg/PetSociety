//
//  ModalProgressView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 29/03/2023.
//

import SwiftUI

struct ModalProgressView: View {
    var body: some View {
        HStack {
            ProgressView().scaleEffect(3)
                .tint(.white)
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
    }
}

struct ModalProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ModalProgressView()
    }
}
