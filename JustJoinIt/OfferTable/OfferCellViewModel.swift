//
//  OfferCellViewModel.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 08/10/2022.
//

import Foundation

class OfferCellViewModel {
    private let offer: Offer
    
    init(offer: Offer) {
        self.offer = offer
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
        return offer.workplace_type
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
                return employmentTypes.append("Undisclosed Salary - \(employment.type)")
            }
            employmentTypes.append("\(rangeMin) - \(rangeMax)k \(currency.uppercased()) - \(employment.type)")
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

extension Double {
    /// Rounds the double to decimal places value
    func roundedTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
