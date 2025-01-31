//
//  AuthViewModel.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 22/01/2025.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("User successfully logged in.")
            self.isAuthenticated = true
        }
    }
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("User successfully created")
            self.isAuthenticated = true
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
        } catch {
            print(error.localizedDescription)
        }
    }
}
