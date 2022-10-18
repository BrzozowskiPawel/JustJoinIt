//
//  OfferInfoRightPanel.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 19/10/2022.
//

import SwiftUI

struct OfferInfoRightPanel: View {
    private let newOffer: Bool
    private let location: String
    
    init(isNew newOffer: Bool, location: String) {
        self.newOffer = newOffer
        self.location = location
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            if(newOffer) {
                Text("NEW")
                    .font(.system(size: 8))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 4.0)
                    .foregroundColor(.gray)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(16)
            }
            Spacer()
            HStack {
                Text(location)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
        }
    }
}

struct OfferInfoRightPanel_Previews: PreviewProvider {
    static var previews: some View {
        let mockVM = OfferListCellViewModel.mockVM()
        OfferInfoRightPanel(
            isNew: mockVM.isNewOffer(),
            location: mockVM.getLocation())
    }
}
