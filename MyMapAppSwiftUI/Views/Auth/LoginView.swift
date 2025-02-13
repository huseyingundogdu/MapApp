//
//  LoginView.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import SwiftUI
import SwiftfulRouting

struct LoginView: View {
    @Environment(\.router) var router
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe.europe.africa")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(.secondary, lineWidth: 1)
                }
            
            SecureField("Password", text: $password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(.secondary, lineWidth: 1)
                }
            
            Button {
                authViewModel.login(email: email, password: password)
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            }
            
            Button {
                router.showScreen(.push) { _ in
                    RegisterView()
                }
            } label: {
                Text("Register")
                    .fontWeight(.semibold)
                    .frame(height: 55)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
