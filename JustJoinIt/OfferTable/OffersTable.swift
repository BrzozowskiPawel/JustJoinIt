//
//  OffersTable.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 07/10/2022.
//

import SwiftUI

struct OffersTable: View {
    let offersArray: [Offer]
    
    var body: some View {
        List {
            ForEach(offersArray) {
                OfferCellView(viewModel: OfferCellViewModel(offer: $0))
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .background(.gray.opacity(0.1))
    }
}

struct OffersTable_Previews: PreviewProvider {
    static var previews: some View {
        
        let mockupOffers = [
            Offer(title: "Test",
                  street: "Ulica",
                  city: "Poznan",
                  country_code: "PL",
                  address_text: "Adress",
                  marker_icon: "Test",
                  workplace_type: "Workplace",
                  company_name: "Company name",
                  company_url: "url to company",
                  company_size: "company size",
                  experience_level: "mid",
                  latitude: "1123",
                  longitude: "1234",
                  published_at: "today",
                  remote_interview: true,
                  open_to_hire_ukrainians: true,
                  id: "id",
                  display_offer: true,
                  employment_types: [EmploymentType(
                    type: "Empl type", salary: Salary(
                        from: 1000,
                        to: 10000,
                        currency: "PLN"))],
                  company_logo_url: "logo url",
                  skills: [Skill(
                    name: "swift",
                    lavel: 3)],
                  remote: true,
                  multilocation: [Location(
                    city: "Poznan",
                    slug: "slug",
                    street: "Street")],
                  way_of_apply: "way of apply")
        ]
        OffersTable(offersArray: mockupOffers)
    }
}
