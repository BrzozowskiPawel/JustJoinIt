//
//  DetailOfferSummary.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 23/10/2022.
//

import SwiftUI

struct DetailOfferSummary: View {
    private let viewModel: DetailViewModel
    
    init(for model: DetailViewModel) {
        self.viewModel = model
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            DetailsNavigationButtons()
                .padding(.vertical, 16)
            
            HStack (alignment: .center, spacing: 30) {
                DetailOfferLogo()
                DetailOfferInfo(
                    title: viewModel.getTitle(),
                    street: viewModel.getStreet(),
                    location: viewModel.getLocation(),
                    workPlace: viewModel.getWorkplace())
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 120,
                maxHeight: 120)
            
            HStack {
                VStack(alignment: .leading) {
                    ForEach(viewModel.getEmploymentTypes(), id: \.self) {
                        DetailSalaryRow(text: $0)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                }
                Spacer()
            }
            .padding(.bottom, 32)
        }
        .padding(.horizontal, 24)
        .background(Color.random().gradient)
    }
}

struct DetailOfferSummary_Previews: PreviewProvider {
    static var previews: some View {
        let mockVM = DetailViewModel.mockVM()
        DetailOfferSummary(for: mockVM)
    }
}
