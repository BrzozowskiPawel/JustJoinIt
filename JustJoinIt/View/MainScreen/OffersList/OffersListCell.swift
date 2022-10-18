//
//  OffersListCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 18/10/2022.
//

import SwiftUI

struct OffersListCell: View {
    private let viewModel: OfferListCellViewModel
    
    init(for offer: Offer) {
        self.viewModel = OfferListCellViewModel(offer: offer)
    }
    
    var body: some View {
        
        HStack {
            CompanyLogo(logoURL: viewModel.getCompanyLogoUrl())
            
            OfferMainInfo(vm: viewModel)
                .padding(.vertical, 8)
            Spacer()
            OfferSecondaryInfo(newOffer: viewModel.isNewOffer(), location: viewModel.getLocation())
                .padding(.trailing, 8)
                .padding(.vertical, 8)
        }
        .background(.white)
        .cornerRadius(6)
        .frame(height: 60)
        .padding(.horizontal, 6)
        .padding(.top, 5)
        .listRowBackground(Color.clear)
    }
}

struct OffersListCell_Previews: PreviewProvider {
    static var previews: some View {
        let offer = OfferListCellViewModel.mockOffer()
        OffersListCell(for: offer)
    }
}

private struct OfferSecondaryInfo: View {
    let newOffer: Bool
    let location: String
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

private struct OfferMainInfo: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    let vm: OfferListCellViewModel
    var body: some View {
        VStack (alignment: .leading){
            
            Button(vm.getTitle()) {
                Task {
                    do {
                        let url = URLs.detailOffer(for: vm.getID())
                        let detailOffer = try await NetworkManager.shared.getDetailOffer(atUrl: url)
                        
                        let detailVM = DetailViewModel(offer: detailOffer)
                        self.viewControllerHolder?.present(style: .fullScreen) {
                            Text("Detail View")
                        }
                    }
                    catch {
                        print("❌ Error - \(error.localizedDescription)")
                    }
                }
            }
            .fontWeight(.medium)
            .font(.system(size: 14))
            .lineLimit(1)
            
            Spacer()
            Text(vm.getSalary())
                .foregroundColor(.green)
                .font(.system(size: 12))
        }
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

