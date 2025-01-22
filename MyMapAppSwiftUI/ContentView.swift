//
//  ContentView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        if authViewModel.isAuthenticated {
            LocationsView()
                .environmentObject(authViewModel)
        } else {
            LoginView()
                .environmentObject(authViewModel)
        }    
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
        .environmentObject(LocationsViewModel())
}
