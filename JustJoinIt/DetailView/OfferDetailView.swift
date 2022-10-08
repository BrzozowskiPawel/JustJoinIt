//
//  OfferDetailView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 08/10/2022.
//

import SwiftUI

struct OfferDetailView: View {
    let viewModel: OfferCellViewModel
    var body: some View {
        VStack {
            
            
            VStack {
                VStack(alignment: .leading) {
                    NavigationButtons()
                        .padding(.vertical, 8)
                        .padding(.horizontal, 8)
                    
                    HStack (alignment: .center, spacing: 16) {
                        OfferLogo()
                        
                        OfferDetails(
                            title: viewModel.getTitle(),
                            street: viewModel.getStreet(),
                            location: viewModel.getLocation(),
                            workPlace: viewModel.getWorkplace())
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 120,
                        maxHeight: 120)
                    .padding(.horizontal, 8)
                    
                    
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.getEmploymentTypes(), id: \.self) {
                            SalaryText(text: $0)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
            .background(Color.random().gradient)
            
            Spacer()
            
            Text("Salary chart")
            
            Text("Company info")
            
            Text("Map")
            
            Spacer()
        }
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferCellViewModel.mockVM())
    }
}

private struct SalaryText: View {
    let text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .font(.system(size: 17))
            .lineLimit(1)
    }
}
private struct NavigationButtons: View {
    var body: some View {
        HStack {
            Button {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "dismissModal"), object: nil)
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "paperplane")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        }
    }
}

private struct OfferLogo: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(.white)
            .padding(20)
            .background(Color.green)
            .clipShape(Circle())
    }
}

private struct OfferDetails: View {
    let title: String
    let street: String
    let location: String
    let workPlace: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .lineLimit(1)
            
            Spacer()
            
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(street + ",")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(location)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            Text(workPlace)
                .padding(.vertical, 2)
                .padding(.horizontal, 4)
                .font(.system(size: 12))
                .background(.white)
                .foregroundColor(.pink)
                .cornerRadius(4)
        }
        .padding(.vertical, 16)
    }
}
