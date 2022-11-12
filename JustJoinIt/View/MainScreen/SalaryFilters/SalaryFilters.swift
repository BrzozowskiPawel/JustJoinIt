//
//  SalaryFilters.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 12/11/2022.
//

import SwiftUI

struct SalaryFilters: View {
    var body: some View {
        HStack(spacing: 0){
            SalaryOfferButton("With Salary")
            SalaryOfferButton("All offers")
            Spacer()
            RemoteOffersSwitch()
        }
        .padding(.horizontal, 8)
        .padding(.top, 8)
    }
}

struct SalaryFilters_Previews: PreviewProvider {
    static var previews: some View {
        SalaryFilters()
    }
}
