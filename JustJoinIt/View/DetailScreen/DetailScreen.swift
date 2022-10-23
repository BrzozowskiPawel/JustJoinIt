//
//  DetailScreen.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 19/10/2022.
//

import SwiftUI

struct DetailScreen: View {
    
    var body: some View {
        ScrollView {
            DetailsNavigationButtons()
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
            Text("HELLO!")
            Spacer()
        }
        .background(.gray.opacity(0.1))
        
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
