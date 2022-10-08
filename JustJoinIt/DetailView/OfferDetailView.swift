//
//  OfferDetailView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 08/10/2022.
//

import SwiftUI

struct OfferDetailView: View {
    let viewModel: OfferCellViewModel
    var body: some View {
        VStack {
            TopBarView()
             Button("Cancel") {
                   NotificationCenter.default.post(name: Notification.Name(rawValue: "dismissModal"), object: nil)
            }
        }
        
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferCellViewModel.mockVM())
    }
}
