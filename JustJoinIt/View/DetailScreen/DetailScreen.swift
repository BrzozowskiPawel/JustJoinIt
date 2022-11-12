//
//  DetailScreen.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 19/10/2022.
//

import SwiftUI

struct DetailScreen: View {
    private let model: DetailViewModel
    
    init(for offer: DetailOffer) {
        self.model = DetailViewModel(offer: offer)
    }
    
    var body: some View {
        ScrollView {
            DetailOfferSummary(for: model)
            DetailOfferHighlights(for: model)
            MapView(for: model)
            TechStack(for: model)
            DetailOfferDescriptionView(for: model)
        }
        .background(.gray.opacity(0.15))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let offer = DetailViewModel.mockDetailOffer()
        DetailScreen(for: offer)
    }
}
