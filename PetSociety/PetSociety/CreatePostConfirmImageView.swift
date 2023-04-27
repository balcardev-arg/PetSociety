//
//  CreatePostConfirmImageView.swift
//  PetSociety
//
//  Created by Layla Cisneros on 25/04/2023.
//

import SwiftUI
import PhotosUI

struct CreatePostConfirmImageView: View {
    @State private var description: String = ""
    @StateObject var photoPicker: PhotoPicker = PhotoPicker()
    
    var body: some View {
        NavigationView {
            ZStack {
                ColorExtensionView()
                VStack {
                    ZStack (alignment: .bottom){
                        PhotosPicker(selection: $photoPicker.photoSelection, matching: .images, photoLibrary: .shared()) {
                            (photoPicker.image ?? Image(systemName: "photo"))
                                .resizable()
                                .scaledToFit()
                                .frame(width: .infinity, height: 400)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                        }
                        ZStack {
                            TextEditor(text: $description)
                                .scrollContentBackground(.hidden)
                                .foregroundColor(.white)
                                .background(.gray.opacity(0.95))
                                .frame(width: .infinity, height: 100)
                            if description.isEmpty {
                                Text("Insert a description or leave in blank")
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 100))
                            }
                        }
                    }
                    Spacer()
                }.toolbar {
                    ToolbarItem {
                        Button(action: {}) {
                            Text("Create")
                        }
                        .foregroundColor(photoPicker.image != nil ? .blue : .black)
                    }
                }
            }
        }
    }
}

struct CreatePostConfirmImageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostConfirmImageView()
    }
}
