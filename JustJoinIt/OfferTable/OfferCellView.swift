//
//  OfferCellView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 07/10/2022.
//

import SwiftUI

struct OfferCellView: View {
    let viewModel: OfferCellViewModel
    
    var body: some View {
        
        HStack {
            CompanyLogo(logoURL: viewModel.getCompanyLogoUrl())
            
            OfferMainInfo(title: viewModel.getTitle(), salary: viewModel.getSalary())
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
        .padding(.vertical, 2)
        .listRowBackground(Color.clear)
    }
}

private struct OfferSecondaryInfo: View {
    let newOffer: Bool
    let location: String
    var body: some View {
        VStack(alignment: .trailing) {
            if(newOffer) {
                Text("NEW")
                    .font(.system(size: 10))
                    .padding(.vertical, 3.0)
                    .padding(.horizontal, 6.0)
                    .background(.gray.opacity(0.4))
                    .foregroundColor(.gray)
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
    let title: String
    let salary: String
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .fontWeight(.medium)
                .font(.system(size: 14))
                .lineLimit(1)
            Spacer()
            Text(salary)
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

struct OfferCellView_Previews: PreviewProvider {
    static var previews: some View {
        OfferCellView(viewModel: OfferCellViewModel.mockVM())
    }
}
