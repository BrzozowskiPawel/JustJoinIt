//
//  FilterButtons.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 31/10/2022.
//

import SwiftUI

struct FilterButtons: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 SearchButton()
                 StyledButton(
                    title: "Location",
                    action: {})
                 StyledButton(
                    title: "Tech",
                    action: {})
                 StyledButton(
                    title: "More Filters",
                    action: {})
                 StyledButton(
                    title: "Latest",
                    action: {})
//                 FilterTechButton()
//                 MoreFilters()
             }
             .padding(.vertical, 2)
        }
        .padding(6)
        .border(width: 0.5, edges: [.bottom], color: .gray.opacity(0.5))
    }
}

struct FilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtons()
    }
}
