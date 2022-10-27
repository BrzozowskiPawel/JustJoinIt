//
//  Place.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
