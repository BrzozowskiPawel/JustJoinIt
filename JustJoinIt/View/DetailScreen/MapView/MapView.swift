//
//  MapView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion
    let places: [Place]
    
    init(for data: MapViewData) {
        self.region = data.region
        self.places = data.places
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.coordinate) {
                Image(systemName: "laptopcomputer")
                  .resizable()
                  .frame(width: 10, height: 10)
                  .foregroundColor(.white)
                  .padding(8)
                  .background(.purple)
                  .clipShape(Circle())
            }
        }
        .frame(height: 200)
    }
}
