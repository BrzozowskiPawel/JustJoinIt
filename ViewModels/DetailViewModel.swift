//
//  DetailViewModel.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 10/10/2022.
//

import Foundation
import MapKit

class DetailViewModel {
    private let offer: DetailOffer
    
    init(offer: DetailOffer) {
        self.offer = offer
    }
    
    func getMapData() -> MapViewData {
        return MapViewData(
            region: MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: Double(offer.latitude) ?? 0,
                    longitude: Double(offer.longitude) ?? 0),
                latitudinalMeters: 1000, longitudinalMeters: 1000),
            places: [
                Place(
                    name: offer.title,
                    coordinate: CLLocationCoordinate2D(
                        latitude:  Double(offer.latitude) ?? 0,
                        longitude: Double(offer.longitude) ?? 0))
            ])
    }
    
    func getDescription() -> String {
        return offer.body
    }
    
    func getIdentifiableSkills() -> [IdentifiableSkill] {
        var identifiableSkills = [IdentifiableSkill]()
        offer.skills.forEach { identifiableSkills.append(IdentifiableSkill(skill: $0))}
        return identifiableSkills
    }
    
    func isRemoteInterview() -> Bool {
        return offer.remote_interview
    }
    func getTechStackHeight() -> CGFloat {
        return CGFloat(offer.skills.count) / 2 * 90
    }
    
    func getCompanyName() -> String {
        return self.offer.company_name
    }
    
    func getCompanySize() -> String {
        return offer.company_size
    }
    
    func getExp() -> String {
        return offer.experience_level
    }
    
    func getHowOldOfferIs() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        let publishedAt = formatter.date(from: offer.published_at) ?? .now
        let daysSinceLastActivity = Calendar.current.dateComponents([.day], from: publishedAt, to: .now).day ?? 0
        if daysSinceLastActivity < 1 {
            return "NEW"
        } else if daysSinceLastActivity == 1 {
            return "\(daysSinceLastActivity) day ago"
        } else {
            return "\(daysSinceLastActivity) days ago"
        }
        
    }
    
    func getCompanyLogoUrl() -> String {
        return offer.company_logo_url
    }
    
    func getStreet() -> String {
        return offer.street ?? ""
    }
    
    func getTitle() -> String {
        return offer.title
    }
    
    func getWorkplace() -> String {
        let workplace = String(offer.workplace_type.map {
            $0 == " " ? "+" : $0
        })
        
        return workplace.capitalized
    }
    
    func getLocation() -> String {
        if offer.multilocation.count > 1  {
            return "\(offer.multilocation[0].city) +\(offer.multilocation.count)"
        } else {
            return offer.multilocation[0].city
        }
    }
    
    // TODO: Fix getEmplomentType and getSalary to be more generic
    func getEmploymentTypes() -> [String] {
        var employmentTypes = [String]()
        offer.employment_types.forEach { employment in
            // TODO: Fix - could be Undisclosed Salary but have a 2 or 3 work types (B2B/Permament...)
            guard let rangeMin = employment.salary?.from,
                    let rangeMax = employment.salary?.to,
                    let currency = employment.salary?.currency else {
                return employmentTypes.append("Undisclosed Salary")
            }
            
            let employment = employment.type == "b2b" ? employment.type.uppercased() : employment.type.capitalized
            
            employmentTypes.append("\(rangeMin) - \(rangeMax) \(currency.uppercased()) - \(employment)")
        }
        return employmentTypes
    }
    
    func isNewOffer() -> Bool {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        let publishedAt = formatter.date(from: offer.published_at) ?? .now
        let hoursSinceLastActivity = Calendar.current.dateComponents([.hour], from: publishedAt, to: .now).hour ?? 0
        return hoursSinceLastActivity < 24 ? true : false
    }
    
    func getSalary() -> String{
        guard let rangeMin = offer.employment_types[0].salary?.from,
                let rangeMax = offer.employment_types[0].salary?.to,
                let currency = offer.employment_types[0].salary?.currency else {
            return "Undisclosed Salary"
        }
        
        let rangeMinRounded = (Double(rangeMin) / 1000.0).roundedTo(toPlaces: 1)
        let rangeMaxRounded = (Double(rangeMax) / 1000.0).roundedTo(toPlaces: 1)
        
        return "\(rangeMinRounded)k - \(rangeMaxRounded)k \(currency.uppercased())"
    }
}
