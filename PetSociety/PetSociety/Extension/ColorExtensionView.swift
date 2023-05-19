//
//  ColorExtensionView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 29/03/2023.
//

import SwiftUI

struct ColorExtensionView: View {
    var body: some View {
        ZStack{
            Color("backgroundColor").ignoresSafeArea()
        }
    }
}

struct ColorExtensionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtensionView()
    }
}
