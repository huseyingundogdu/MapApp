//
//  ContentView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 02/10/2024.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        RouterView { _ in
            if authViewModel.isAuthenticated {
                LocationsView()
                    .environmentObject(authViewModel)
            } else {
                LoginView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
        .environmentObject(LocationsViewModel())
}
