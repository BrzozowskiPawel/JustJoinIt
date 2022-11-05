//
//  SearchButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .padding(6)
            .frame(width: 24, height: 24)
            .foregroundColor(.black.opacity(0.5))
            .background(.gray.opacity(0.7))
            .cornerRadius(12)
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
    }
}
