//
//  LocationsListView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 04/10/2024.
//

import SwiftUI

struct LocationsListView: View {
    @Environment(\.router) var router
    @EnvironmentObject private var vm: LocationsViewModel
    @EnvironmentObject private var authVM: AuthViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showSelectedLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .listRowBackground(Color.clear)
            }
            
            
            
        }
        .listStyle(.plain)
        
        HStack {
            Button {
                router.showScreen(.push) { _ in
                    SelectLocationView()
                }
            } label: {
                Text("New")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Button {
                withAnimation(.linear) {
                    vm.isShowingLocationsList = false
                    authVM.isAuthenticated = false
                }
            } label: {
                Image(systemName: "power")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
