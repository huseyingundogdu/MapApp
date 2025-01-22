//
//  SelectLocationView.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import SwiftUI
import MapKit

struct SelectLocationView: View {
    private let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    @State private var coordinates: CLLocationCoordinate2D?
    @State private var position: MapCameraPosition = MapCameraPosition.automatic
    
    var body: some View {
        mapSection
            .overlay(alignment: .topLeading) {
                backButton
            }
            .overlay(alignment: .topTrailing) {
                nextButton
            }
    }
}

#Preview {
    SelectLocationView()
}


extension SelectLocationView {
    
    private func updateMapCameraPosition(coordinates: CLLocationCoordinate2D) {
        withAnimation(.easeInOut(duration: 1)) {
            position = .region(
                MKCoordinateRegion(
                    center: coordinates,
                    span: span)
            )
        }
    }
    
    private var mapSection: some View {
        MapReader { proxy in
            Map(position: $position) {
                if let coordinates = coordinates {
                    Annotation("", coordinate: coordinates) {
                        LocationMapAnnotationView()
                            .shadow(radius: 10)
                    }
                }
            }
            .onTapGesture { location in
                if let coordinates = proxy.convert(location, from: .local) {
                    self.coordinates = coordinates
                    updateMapCameraPosition(coordinates: coordinates)
                }
            }
        }
    }
    
    private var backButton: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.left")
                .font(.headline)
                .padding(16)
                .frame(width: 55, height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThickMaterial)
                }
                .shadow(radius: 10)
                .padding()
        }
    }
    
    private var nextButton: some View {
        Button {
            
        } label: {
            Text("Next")
                .foregroundStyle(.white)
                .font(.headline)
                .padding(16)
                .frame(height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.primary)
                }
                .shadow(radius: 10)
                .padding()
        }
    }
}
