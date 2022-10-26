//
//  DetailOfferHighlights.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI
import QGrid

struct DetailOfferHighlights: View {
    private let viewModel: DetailViewModel

    init(for vm: DetailViewModel) {
        self.viewModel = vm
    }
    
    var body: some View {
        VStack(spacing: 0) {
            OfferHighlightComponentRow(
                firstTile: .companyName,
                secondTile: .companySize,
                vm: viewModel)
            OfferHighlightComponentRow(
                firstTile: .expLvl,
                secondTile: .added,
                vm: viewModel)
        }
    }
}

struct DetailOfferHighlights_Previews: PreviewProvider {
    static var previews: some View {
        DetailOfferHighlights(for: DetailViewModel.mockVM())
    }
}
