//
//  SeniorityButtons.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct SeniorityButtons: View {
    private let buttons: [SeniorityEnum] = [.All, .Junior, .Mid, .Senior]
    var body: some View {
        VStack {
            HStack {
                Text("Seniority")
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

struct SeniorityButtons_Previews: PreviewProvider {
    static var previews: some View {
        SeniorityButtons()
    }
}
