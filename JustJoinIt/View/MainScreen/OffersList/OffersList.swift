//
//  OffersList.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 18/10/2022.
//

import SwiftUI

struct OffersList: View {
    private let offersArray: [Offer]
    
    init(for offers: [Offer]) {
        self.offersArray = offers
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(offersArray) { offer in
                    OffersListCell(for: offer)
                }
            }.padding(.top, 2)
        }
        .background(.gray.opacity(0.15))
    }
}

struct OffersList_Previews: PreviewProvider {
    static var previews: some View {
        let mockupOffers = OfferListCellViewModel.mockOffers()
        OffersList(for: mockupOffers)
    }
}
