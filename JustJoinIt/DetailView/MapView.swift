//
//  MapView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 09/10/2022.
//

import SwiftUI
import MapKit

struct MapViewData {
    let region: MKCoordinateRegion
    let places: [Place]
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var region: MKCoordinateRegion
    let places: [Place]
    
    init(data: MapViewData) {
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

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(region: region, places: places)
//    }
//}
