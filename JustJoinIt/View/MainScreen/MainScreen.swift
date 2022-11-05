//
//  MainScreen.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 17/10/2022.
//

import SwiftUI

struct MainScreen: View {
    private let offers: [Offer]
    
    init(with offers: [Offer]) {
        self.offers = offers
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TopBar()
            FilterButtons()
            OffersList(for: offers)
            Spacer()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        let mockupOffers = OfferListCellViewModel.mockOffers()
        MainScreen(with: mockupOffers)
    }
}
