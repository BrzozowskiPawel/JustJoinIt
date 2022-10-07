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
                 Image(systemName: "magnifyingglass")
                   .resizable()
                   .frame(width: 16, height: 16)
                   .foregroundColor(.gray)
                   .padding(8)
                   .background(.gray.opacity(0.5))
                   .clipShape(Circle())
                 FilterTile(name: "Location")
                 FilterTile(name: "Mobile")
                 FilterTile(name: "More filters")
                 FilterTile(name: "Latest")
             }
        }
        .padding(.horizontal, 8.0)
    }
}

struct FiltersView_Previews: PreviewProvider {
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
                .padding(.vertical, 6.0)
                .padding(.horizontal, 12.0)
                .background(isSelected ? Color.pink.opacity(0.3) : .white)
                .foregroundColor(isSelected ? .pink : .gray)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? .pink : .gray, lineWidth: 1)
                )
        }
        .cornerRadius(16)

    }
}
