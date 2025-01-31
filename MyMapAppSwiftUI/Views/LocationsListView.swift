//
//  LocationsListView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 04/10/2024.
//

import SwiftUI

struct LocationsListView: View {
    @Environment(\.dismiss) private var dismiss
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
                vm.isShowingLocationsList = false
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
                    authVM.logout()
                    vm.resetTheFetchedDatas()
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
                AsyncImage(url: URL(string: imageName)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .tint(.white)
                }
                .frame(width: 45, height: 45)
                .background(Color.primary)
                .clipShape(RoundedRectangle(cornerRadius: 8))

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
