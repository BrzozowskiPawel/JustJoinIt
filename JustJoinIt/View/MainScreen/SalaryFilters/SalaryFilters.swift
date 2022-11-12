//
//  SalaryFilters.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 12/11/2022.
//

import SwiftUI

struct SalaryFilters: View {
    var body: some View {
        HStack {
            SalaryOfferButton("With Salary")
            SalaryOfferButton("All offers")
            Spacer()
            RemoteOffers()
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
}

struct SalaryFilters_Previews: PreviewProvider {
    static var previews: some View {
        SalaryFilters()
    }
}