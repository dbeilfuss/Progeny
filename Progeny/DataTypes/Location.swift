//
//  Location.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//

import Foundation
import CoreLocation
import UIKit

class LocationClass: ObservableObject {
    
    @Published var testLocationList: [Location] = [
        Location(
            name: "Green Pastures Park",
            coordinates: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            address: "123 Main Street, Springfield, USA",
            description: "A peaceful park with lots of greenery and open spaces.",
            animals: [UUID()],
            isPinned: false
        ),
        Location(
            name: "Sunny Farms",
            coordinates: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
            address: "789 Sunflower Lane, Sunnyville, USA",
            description: "A farm famous for its beautiful sunflower fields.",
            animals: nil,
            isPinned: false
        ),
        Location(
            name: "Mountain Retreat",
            coordinates: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
            address: "456 Highland Road, Mountainview, USA",
            description: "A cozy retreat in the heart of the mountains.",
            animals: [UUID(), UUID()],
            isPinned: false
        )
    ]
}

class Location: ObservableObject, Identifiable, Hashable {
    
    // Identity
    let id: UUID
    @Published var name: String
    @Published var coordinates: CLLocationCoordinate2D?
    @Published var address: String?
    @Published var description: String?
    @Published var photo: UIImage?
    @Published var animals: [UUID]?
    @Published var isPinned: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        coordinates: CLLocationCoordinate2D? = nil,
        address: String? = nil,
        description: String? = nil,
        photo: UIImage? = nil,
        animals: [UUID]? = nil,
        isPinned: Bool = false
    ) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.address = address
        self.description = description
        self.photo = photo
        self.animals = animals
        self.isPinned = isPinned
    }
    
    // Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
