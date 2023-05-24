//
//  PhotoPicker.swift
//  PetSociety
//
//  Created by Layla Cisneros on 27/03/2023.
//

import Foundation
import PhotosUI
import SwiftUI


final class PhotoPicker: ObservableObject {
    @Published var image: Image? = nil
    @Published var photoSelection: PhotosPickerItem? {
    didSet {
        if let photoSelection {
            loadTransferable(from: photoSelection)
            }
        }
    }
    var imageData = Data()
    
    private func loadTransferable(from photoSelection: PhotosPickerItem){
        photoSelection.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                guard photoSelection == self.photoSelection else { return }
                switch result {
                case .success(let data):
                    let uiImage = UIImage(data: data!)
                    self.image = Image(uiImage: uiImage!)
                case .failure(let error):
                    print("Error load transferable \(error)")
                    self.image = Image(systemName: "multiply.circle.fill")
                }
            }
        }
    }
}
