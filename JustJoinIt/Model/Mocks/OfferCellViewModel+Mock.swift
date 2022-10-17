//
//  OfferCellViewModel+Mock.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 08/10/2022.
//

import Foundation

// MARK: OfferCellViewModel Mock
extension OfferCellViewModel {
    static func mockOffer() -> Offer {
        return Offer(
            title: "iOS Developer (DDL)",
            street: "aleja Grunwaldzka 415",
            city: "Gdańsk",
            country_code: "PL",
            address_text: "aleja Grunwaldzka 415, Gdańsk",
            marker_icon: "mobile",
            workplace_type: "partly_remote",
            company_name: "Lufthansa Systems",
            company_url: "https://lhsystems.pl/lhsystems.html",
            company_size: ">800",
            experience_level: "mid",
            latitude: "54.4007539",
            longitude: "18.5751699",
            published_at: "2022-10-08T10:00:09.985Z",
            remote_interview: true,
            open_to_hire_ukrainians: true,
            id: "lufthansa-systems-ios-developer-ddl",
            display_offer: true,
            employment_types: [
                EmploymentType(
                    type: "b2b",
                    salary: Salary(
                        from: 11000,
                        to: 20600,
                        currency: "PLN")),
                EmploymentType(
                    type: "permanent",
                    salary: Salary(
                        from: 8000,
                        to: 15000,
                        currency: "PLN"))],
            company_logo_url: "https://bucket.justjoin.it/offers/company_logos/thumb/f5b18bc880fa666c7aadea34e5045deb3b109692.png?1654162146",
            skills: [
                Skill(
                    name: "Git",
                    level: 3),
                Skill(
                    name: "JIRA",
                    level: 3),
                Skill(
                    name: "Swift",
                    level: 3)],
            remote: false,
            multilocation: [
                Location(
                    city: "Poznań",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Gdańsk",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Warszawa",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Kraków",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl")],
            way_of_apply: "redirect")
    }
    static func mockVM() -> OfferCellViewModel {
        let mockOffer = self.mockOffer()
        return OfferCellViewModel(offer: mockOffer)
    }
}
