//
//  NewLocationViewModel.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import Foundation
import PhotosUI
import SwiftUI

class NewLocationViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var name: String = ""
    @Published var cityName: String = ""
    @Published var description: String = ""
    
    @Published var selectedItems: [PhotosPickerItem] = [] {
        didSet {
            self.isLoading = true
            self.setImages(from: self.selectedItems)
        }
    }
    @Published var selectedImages: [UIImage] = []
    
    private func setImages(from selection: [PhotosPickerItem]) {
        Task {
            selectedImages.removeAll()
            
            for item in selection {
                if let data = try? await item.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        selectedImages.append(uiImage)
                    }
                }
            }
            self.isLoading = false
        }
    }
    
}
