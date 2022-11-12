//
//  SalaryOfferButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 12/11/2022.
//

import SwiftUI

struct SalaryOfferButton: View {
    @State private var isSelected: Bool = true
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        
        Button {
            withAnimation {
                isSelected.toggle()
            }
        } label: {
            Text(name)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(8)
                .background(
                    isSelected
                    ? Color.gray.opacity(0.15)
                    : Color.white)
                .cornerRadius(12, corners: [.topLeft, .topRight])
                .padding(.trailing, 4)
        }

        
    }
}

struct SalaryOfferButton_Previews: PreviewProvider {
    static var previews: some View {
        SalaryOfferButton("With salary")
    }
}
