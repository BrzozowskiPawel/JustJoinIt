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
            AsyncImage(url: URL(string: viewModel.getCompanyLogoUrl())) { image in
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
            
            VStack (alignment: .leading){
                Text(viewModel.getSalary())
                    .font(.system(size: 15))
                    .lineLimit(1)
                Spacer()
                Text(viewModel.getSalary())
                    .foregroundColor(.green)
                    .font(.system(size: 12))
            }
            .padding(.vertical, 8)
            Spacer()
            VStack(alignment: .trailing) {
                Text("NEW")
                    .font(.system(size: 10))
                    .padding(.vertical, 3.0)
                    .padding(.horizontal, 6.0)
                    .background(.gray.opacity(0.4))
                    .foregroundColor(.gray)
                    .cornerRadius(16)
                Spacer()
                HStack {
                    Text(viewModel.getLocation())
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                }
            }
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

struct OfferCellView_Previews: PreviewProvider {
    static var previews: some View {
        OfferCellView(viewModel: OfferCellViewModel.mockVM())
    }
}
