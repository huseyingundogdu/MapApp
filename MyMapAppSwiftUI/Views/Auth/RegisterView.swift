//
//  RegisterView.swift
//  MyMapAppSwiftUI
//
//  Created by Hüseyin Gündoğdu on 21/01/2025.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    
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
            
            Button("Register") {
                
            }
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            
        }
        .frame(maxHeight: .infinity)
        .padding()
        .overlay(alignment: .topLeading) {
            backButton
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    RegisterView()
}

extension RegisterView {
    private var backButton: some View {
        Button {
            dismiss()
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
}
