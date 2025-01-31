//
//  Location.swift
//  MyMapAppSwiftUI
//
//  Created by Huseyin on 02/10/2024.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable, Codable {
    
    var id: String {
        name + cityName
    }
    let name: String
    let cityName: String
    let coordinates: Coordinates
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
    
    init(from coordinate: CLLocationCoordinate2D) {
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
