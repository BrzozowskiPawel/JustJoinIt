//
//  OffersTable.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 07/10/2022.
//

import SwiftUI

struct OffersTable: View {
    let offersArray: [Offer]
    
    var body: some View {
        List {
            ForEach(offersArray) {
                OfferCellView(viewModel: OfferCellViewModel(offer: $0))
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .background(.gray.opacity(0.1))
    }
}

struct OffersTable_Previews: PreviewProvider {
    static var previews: some View {
        let mockupOffers = [
            OfferCellViewModel.mockOffer(),
            OfferCellViewModel.mockOffer()
        ]
        OffersTable(offersArray: mockupOffers)
    }
}
