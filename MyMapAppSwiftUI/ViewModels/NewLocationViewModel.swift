//
//  NewLocationViewModel.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class NewLocationViewModel: ObservableObject {
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    
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
    
    func createNewLocation(coordinates: Coordinates) async {
        isLoading = true
        if let user = Auth.auth().currentUser {
            
                let imageURLs = await putImageDataAndgetImageURLs()
                
                let newLocation = Location(
                    name: name,
                    cityName: cityName,
                    coordinates: coordinates,
                    description: description,
                    imageNames: imageURLs,
                    link: "www.google.com")
                
                do {
                    try self.db.collection("users").document(user.uid).collection("locations").addDocument(from: newLocation)
                    
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                    isLoading = false
                }
            
        }
    }
    
    func putImageDataAndgetImageURLs() async -> [String] {
        var imageURLs: [String] = []
        let imagesFolder = storage.reference().child("images")
        
        for image in selectedImages {
            if let data = image.jpegData(compressionQuality: 0.3) {
                let uuid = UUID().uuidString
                let imageRef = imagesFolder.child("\(uuid).jpg")
                
                do {
                    _ = try await imageRef.putDataAsync(data, metadata: nil)
                    let url = try await imageRef.downloadURL()
                    imageURLs.append(url.absoluteString)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        return imageURLs
    }
}
