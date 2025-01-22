//
//  LocationMapAnnotationView.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 05/10/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,
                       height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(.primary)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundStyle(.primary)
                .rotationEffect(.degrees(180))
                .offset(y: -3.0)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    ZStack {
        Color.blue
        LocationMapAnnotationView()
            .background(.red)
    }
}
