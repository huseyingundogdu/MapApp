//
//  NewLocationView.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import SwiftUI
import MapKit
import PhotosUI

struct NewLocationView: View {
    
    @StateObject private var vm = NewLocationViewModel()
    let coordinates: CLLocationCoordinate2D
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(radius: 10, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.clear)
        .overlay(alignment: .topLeading) {
            backButton
        }
        .overlay(alignment: .topTrailing) {
            doneButton
        }
    }
}

#Preview {
    NewLocationView(coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922))
}

extension NewLocationView {
    private var imageSection: some View {
        PhotosPicker(selection: $vm.selectedItems, matching: .images) {
            if vm.isLoading {
                ProgressView()
                    .frame(height: 500)
            } else if vm.selectedImages == [] {
                Image(systemName: "photo")
                    .imageScale(.large)
                    .frame(height: 500)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3))
            } else {
                TabView {
                    ForEach(vm.selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .containerRelativeFrame(.horizontal)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(.page)
            }
        }
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField("Name", text: $vm.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            TextField("City name", text: $vm.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Description", text: $vm.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var mapSection: some View {
        Map(position: .constant(MapCameraPosition.region(MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))))) {
                Annotation(vm.name, coordinate: coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
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
    
    private var doneButton: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding(16)
                .frame(width: 55, height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(doneButtonStatus ? .primary : .secondary)
                }
                .shadow(radius: 10)
                .padding()
        }
        .allowsHitTesting(doneButtonStatus)
    }
    
    private var doneButtonStatus: Bool {
        return vm.name != "" && vm.cityName != "" && vm.description != "" && vm.selectedImages != []
    }
}
