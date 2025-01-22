//
//  MyMapAppSwiftUIApp.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 02/10/2024.
//

import SwiftUI

@main
struct MyMapAppSwiftUIApp: App {
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
