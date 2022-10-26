//
//  DetailScreen.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 19/10/2022.
//

import SwiftUI

struct DetailScreen: View {
    private let offerID: String
    // TODO: Download proper offer
    private let model = DetailViewModel.mockVM()
    
    init(forID offerId: String) {
        self.offerID = offerId
    }
    
    var body: some View {
        ScrollView {
            DetailOfferSummary(for: model)
            DetailOfferHighlights(for: model)
            MapView(for: model)
            TechStack(for: model)
            Spacer()
        }
        .background(.gray.opacity(0.1))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let offer = OfferListCellViewModel.mockOffer()
        DetailScreen(forID: offer.id)
    }
}
