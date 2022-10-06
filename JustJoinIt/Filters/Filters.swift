//
//  Filters.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/10/2022.
//

import SwiftUI

struct FiltersView: View {

    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 FilterTile(name: "Location")
                 FilterTile(name: "Mobile")
                 FilterTile(name: "Latest")
             }
        }
        .padding(.horizontal, 8.0)
    }
}

struct Filters_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}

struct FilterTile: View {
    @State private var isSelected: Bool = false
    let tileName: String
    
    init(name: String) {
        self.tileName = name
    }
    
    var body: some View {
        Button {
            self.isSelected.toggle()
        } label: {
            Text(tileName)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 12.0)
                .background(isSelected ? Color.pink.opacity(0.3) : .white)
                .foregroundColor(isSelected ? .pink : .gray)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? .pink : .gray, lineWidth: 1)
                )
                .padding(1)
       
        }

    }

}
