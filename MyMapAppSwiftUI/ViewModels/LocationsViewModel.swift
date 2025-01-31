//
//  LocationsViewModel.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 02/10/2024.
//

import Foundation
import MapKit
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class LocationsViewModel: ObservableObject {
    
    private let db = Firestore.firestore()
    
    @Published var locations: [Location] = []
    @Published var selectedLocation: Location? {
        didSet {
            if let location = selectedLocation {
                updateMapCameraPosition(location: location)
            }
        }
    }
    
    @Published var position: MapCameraPosition = MapCameraPosition.automatic
    
    @Published var isShowingLocationsList: Bool = false
    @Published var sheetLocation: Location? = nil
    
    let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    
    
    
    private func updateMapCameraPosition(location: Location) {
        withAnimation(.easeInOut) {
            position = .region(MKCoordinateRegion(
                center: location.coordinates.coordinate,
                span: span))
        }
    }
    
    func toggleIsShowingLocationsList() {
        withAnimation(.easeInOut) {
            isShowingLocationsList = !isShowingLocationsList
        }
    }
    
    func showSelectedLocation(location: Location) {
        withAnimation(.easeInOut) {
            selectedLocation = location
            isShowingLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == selectedLocation }) else {
            print("Error: -nextButtonPressed()- current index")
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showSelectedLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showSelectedLocation(location: nextLocation)
    }
    
    func getLocations() {
        locations = []
        if let user = Auth.auth().currentUser {
            db.collection("users").document(user.uid).collection("locations").getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                let locations = snapshot?.documents.compactMap { document -> Location? in
                    try? document.data(as: Location.self)
                } ?? []
                
                self.locations = locations
                print(self.locations)
            }
        }
    }
    
    func resetTheFetchedDatas() {
        locations = []
        selectedLocation = nil
        position = .automatic
        isShowingLocationsList = false
        sheetLocation = nil
    }
}
