//
//  DetailOffer.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 10/10/2022.
//

import Foundation

struct DetailOffer: Codable, Identifiable {
    let apply_body: String?
    let title: String
    let street: String
    let city: String
    let country_code: String
    let address_text: String
    let marker_icon: String
    let workplace_type: String
    let company_name: String
    let company_url: String
    let company_size: String
    let experience_level: String
    let latitude: String
    let longitude: String
    let apply_url: String?
    let published_at: String
    let remote_interview: Bool
    let video_key: String?
    let video_provider: String?
    let open_to_hire_ukrainians: Bool
    let future_consent_title: String?
    let future_consent: String?
    let information_clause: String
    let custom_consent_title: String?
    let custom_consent: String?
    let id: String
    let tags: [String]
    let body: String
    let company_logo_url: String
    let banner_url: String?
    let skills: [Skill]
    let remote: Bool
    let employment_types: [EmploymentType]
    let multilocation: [Location]
}
