//
//  ButtonCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct ButtonCell: View {
    @State private var isSelected: Bool = false
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            if isSelected {
                Text(text)
                    .padding(.vertical, 6.0)
                    .padding(.horizontal, 12.0)
                    .background(.pink.opacity(0.2))
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.pink, lineWidth: 1)
                    )
            } else {
                Text(text)
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
    }
}

struct ButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCell("Test")
    }
}
