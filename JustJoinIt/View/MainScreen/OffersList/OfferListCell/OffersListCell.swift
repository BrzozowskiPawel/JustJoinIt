//
//  OffersListCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 18/10/2022.
//

import SwiftUI

struct OffersListCell: View {
    @State private var showingSheet = false
    private let viewModel: OfferListCellViewModel
    
    
    init(for offer: Offer) {
        self.viewModel = OfferListCellViewModel(offer: offer)
    }
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            HStack {
                CompanyLogo(logoURL: viewModel.getCompanyLogoUrl())
                OfferInfoMainPanel(
                    title: viewModel.getOfferTitle(),
                    salary: viewModel.getSalary())
                Spacer()
                OfferInfoRightPanel(
                    isNew: viewModel.isNewOffer(),
                    location: viewModel.getLocation())
            }
            .background(.white)
            .cornerRadius(6)
            .frame(height: 60)
            .padding(.horizontal, 6)
            .padding(.top, 5)
        }
        .sheet(isPresented: $showingSheet) {
            DetailScreen(forID: viewModel.getID())
        }
    }
}

struct OffersListCell_Previews: PreviewProvider {
    static var previews: some View {
        let offer = OfferListCellViewModel.mockOffer()
        OffersListCell(for: offer)
    }
}



private struct CompanyLogo: View {
    let logoURL: String
    var body: some View {
        AsyncImage(url: URL(string: logoURL)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
        } placeholder: {
            ProgressView()
                .frame(width: 44, height: 44)
                .progressViewStyle(.circular)
        }
        .padding(.horizontal, 10)
        .padding(.leading, 4)
    }
}

