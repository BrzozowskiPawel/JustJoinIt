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
    
    func getCompanyLogoUrl() -> String {
        return offer.company_logo_url
    }
    
    func getTitle() -> String {
        return offer.title
    }
    
    func getLocation() -> String {
        if offer.multilocation.count > 1  {
            return offer.multilocation[0].city
        } else {
            return "\(offer.multilocation[0].city) +\(offer.multilocation.count)"
        }
    }
    
    func getSalary() -> String{
        guard let rangeMin = offer.employment_types[0].salary?.from,
                let rangeMax = offer.employment_types[0].salary?.to,
                let currency = offer.employment_types[0].salary?.currency else {
            return "Undisclosed Salary"
        }
        
        let rangeMinRounded = (Double(rangeMin) / 1000.0).roundedTo(toPlaces: 1)
        let rangeMaxRounded = (Double(rangeMax) / 1000.0).roundedTo(toPlaces: 1)
        
        return "\(rangeMinRounded)k - \(rangeMaxRounded)k \(currency)"
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundedTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
