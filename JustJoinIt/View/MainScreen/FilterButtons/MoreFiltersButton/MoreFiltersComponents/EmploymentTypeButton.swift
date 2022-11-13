//
//  EmploymentTypeButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct EmploymentTypeButton: View {
    private let buttons: [EmploymentEnum] = [.All, .B2B, .Permanent, .MandateContract]
    var body: some View {
        VStack {
            HStack {
                Text("Employment Type")
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Spacer()
            }
            ScrollView (.horizontal, showsIndicators: false) {
                 HStack {
                     ForEach(buttons, id: \.self.rawValue) { button in
                         StyledButton(
                            title: button.rawValue,
                            action: {})
                         .padding(.vertical, 2)
                     }
                 }
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .padding(.top, 10)
                .foregroundColor(.gray)
            
        }
        .padding()
    }
}

struct EmploymentTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        EmploymentTypeButton()
    }
}

