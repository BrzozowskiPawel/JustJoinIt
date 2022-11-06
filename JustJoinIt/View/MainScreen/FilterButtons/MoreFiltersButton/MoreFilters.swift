//
//  MoreFilters.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct MoreFilters: View {
    @State private var isSelected: Bool = false
    @State private var selectedTech: TechType? = nil
    @State private var selectedFilters: Int = 0
    
    var body: some View {
        Button {
            self.isSelected.toggle()
        } label: {
            if (isSelected) {
                HStack {
                    Image(systemName: "\(selectedFilters).circle.fill")
                    Text("More filters")
                }
                .padding(.vertical, 6.0)
                .padding(.horizontal, 12.0)
                .background( Color.pink.opacity(0.2))
                .foregroundColor(.pink)
            } else {
                Text("More filters")
                    .padding(.vertical, 6.0)
                    .padding(.horizontal, 12.0)
                    .background(.white)
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        }
        .cornerRadius(16)
        .sheet(isPresented: $isSelected) {
            VStack(spacing: 0) {
                HStack {
                    Text("More filters")
                        .font(.system(size: 23))
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer()
                    Button {
                        isSelected = false
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .border(
                    width: 0.5,
                    edges: [.bottom,.top],
                    color: .gray)
                ScrollView {
                    RangeSelector()
                    EmploymentTypeButton()
                    SeniorityButtons()
                    UkraineFriendlyOffers()
                }
                .border(width: 1, edges: [.bottom], color: .gray)
                
                HStack {
                    Text("Clear Filters")
                        .font(.system(size: 22))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .foregroundColor(.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    Spacer()
                    
                    Text("Show Offers")
                        .font(.system(size: 22))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.pink, lineWidth: 1)
                        )
                }
                .padding()
            }
        }

    }
}

struct MoreFilters_Previews: PreviewProvider {
    static var previews: some View {
        MoreFilters()
    }
}
