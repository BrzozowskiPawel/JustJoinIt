//
//  StyledButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 13/11/2022.
//

import SwiftUI

struct StyledButtonStyle: ButtonStyle {
    
    let cornerRadius: CGFloat = 16
    @Binding var isActive: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isActive ? Color.pink : Color.gray
        return configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .foregroundColor(currentForegroundColor)
            .background(isActive ? Color.pink.opacity(0.05) : Color.white)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(currentForegroundColor.opacity(0.6), lineWidth: 1)
            )
            .font(Font.system(size: 13, weight: .semibold))
    }
}

struct StyledButton: View {
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    @State private var active: Bool
    
    init(title: String,
         active: Bool = false,
         action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.active = active
    }
    
    var body: some View {
        
        Button(action: {
            self.active.toggle()
            self.action()
        }) {
            Text(self.title)
        }
        .buttonStyle(StyledButtonStyle(
            isActive: $active))
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(
            title: "Test",
            action: {})
    }
}
