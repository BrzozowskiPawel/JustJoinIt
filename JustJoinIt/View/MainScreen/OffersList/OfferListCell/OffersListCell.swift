//
//  OffersListCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 18/10/2022.
//

import SwiftUI

struct OffersListCell: View {
    @State private var showingSheet = false
    @State private var offer: DetailOffer?
    private let viewModel: OfferListCellViewModel
    
    
    init(for offer: Offer) {
        self.viewModel = OfferListCellViewModel(offer: offer)
    }
    
    var body: some View {
        Button {
            Task {
                do {
                    // TODO: Work on dispaling spinner and if dowloaded going to the screen
                    let offferURL = URLs.detailOffer(for: viewModel.getID())
                    self.offer = try await NetworkManager.shared.getDetailOffer(atUrl: offferURL)
                    if let offer = offer {
                        showingSheet = true
                    }
                }
                catch {
                    print("❌ Error - \(error.localizedDescription)")
                }
            }
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
            if let offer = offer {
                DetailScreen(for: offer)
            }
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

