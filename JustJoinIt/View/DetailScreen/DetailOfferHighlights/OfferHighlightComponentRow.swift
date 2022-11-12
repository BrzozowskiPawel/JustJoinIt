//
//  OfferHighlightComponent.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI

enum InfoTailType {
    case companyName
    case companySize
    case expLvl
    case added
}

struct OfferHighlightComponentRow: View {
    let firstTile, secondTile: InfoTailType
    let vm: DetailViewModel
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                OfferHighlightSingleComponent(
                    infoTailType: firstTile,
                    vm: vm)
                OfferHighlightSingleComponent(
                    infoTailType: secondTile,
                    vm: vm)
                    .padding(.leading, 6)
            }
            .padding(.top, 3)
            .padding(.horizontal, 6)
            .padding(.bottom, 3)
            .frame(minWidth: 0,
                   maxWidth: .infinity)
        }
        .background(.gray.opacity(0.15))
    }
}

struct OfferHighlightComponentRow_Previews: PreviewProvider {
    static var previews: some View {
        OfferHighlightComponentRow(
            firstTile: .companySize,
            secondTile: .companyName,
            vm: DetailViewModel.mockVM())
    }
}
