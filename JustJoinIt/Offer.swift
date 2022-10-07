//
//  Offer.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 05/10/2022.
//

import Foundation

struct Offer: Codable, Identifiable {
    let title: String
    let street: String?
    let city: String
    let country_code: String?
    let address_text: String
    let marker_icon: String
    let workplace_type: String
    let company_name: String
    let company_url: String
    let company_size: String
    let experience_level: String
    let latitude: String
    let longitude: String
    let published_at: String
    let remote_interview: Bool
    let open_to_hire_ukrainians: Bool
    let id: String
    let display_offer: Bool
    let employment_types: [EmploymentType]
    let company_logo_url: String
    let skills: [Skill]
    let remote: Bool
    let multilocation: [Location]
    let way_of_apply: String
}

struct EmploymentType: Codable {
    let type: String
    let salary: Salary?
}

struct Salary: Codable {
    let from: Int
    let to: Int
    let currency: String
}

struct Skill: Codable {
    let name: String
    let lavel: Int?
}

struct Location: Codable {
    let city: String
    let slug: String
    let street: String?
}
