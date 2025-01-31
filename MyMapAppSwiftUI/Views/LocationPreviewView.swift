//
//  LocationPreviewView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 04/10/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 12) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        
        LocationPreviewView(location: LocalDataService.locations[0])
            .padding()
    }
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let firstImage = location.imageNames.first {
                AsyncImage(url: URL(string: firstImage)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .tint(.white)
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))

//                Image(imageName)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(8)
        .background(Color.primary)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
