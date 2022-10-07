//
//  OfferCellView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 07/10/2022.
//

import SwiftUI

struct OfferCellView: View {
    let offer: Offer
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: offer.company_logo_url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
            } placeholder: {
                ProgressView()
                    .frame(width: 44, height: 44)
                    .progressViewStyle(.circular)
            }
            .padding(.horizontal, 10)
            .padding(.leading, 4)
            
            VStack (alignment: .leading){
                Text(offer.title)
                    .font(.system(size: 15))
                    .lineLimit(1)
                Spacer()
                Text(getSalaryText())
                    .foregroundColor(.green)
                    .font(.system(size: 12))
            }
            .padding(.vertical, 8)
            Spacer()
            VStack(alignment: .trailing) {
                Text("NEW")
                    .font(.system(size: 10))
                    .padding(.vertical, 3.0)
                    .padding(.horizontal, 6.0)
                    .background(.gray.opacity(0.4))
                    .foregroundColor(.gray)
                    .cornerRadius(16)
                Spacer()
                HStack {
                    Text(offer.multilocation[0].city)
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                }
            }
            .padding(.trailing, 8)
            .padding(.vertical, 8)
        }
        .background(.white)
        .cornerRadius(6)
        .frame(height: 60)
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .listRowBackground(Color.clear)
        
    }
    
    func getSalaryText() -> String{
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

struct OfferCellView_Previews: PreviewProvider {
    static var previews: some View {
        OfferCellView(offer: Offer(title: "Test",
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
                                   way_of_apply: "way of apply"))
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundedTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
