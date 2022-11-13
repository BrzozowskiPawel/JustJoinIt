//
//  TopBarView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/10/2022.
//

import SwiftUI

struct TopBar: View {
    @State private var darkMode: Bool = false
    var body: some View {
        HStack {
            Text("justjoin.it")
                .fontWeight(.bold)
            Toggle("dark-mode", isOn: $darkMode)
                .labelsHidden()
            Spacer()
            Button {
                print("SIGN TAPPED")
            } label: {
                Text("Sign in")
                    .padding(.vertical, 6.0)
                    .padding(.horizontal, 8.0)
                    .background(Color.pink.gradient)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .padding(.vertical, 2)
            
            Button {
                print("Currency tapped")
            } label: {
                Text("PLN")
                    .foregroundColor(.gray)
            }
            
            Button {
                print("Currency tapped")
            } label: {
                Image(systemName: "gearshape")
                    .foregroundColor(.gray)
            }

        }
        .padding(.horizontal, 6.0)
        .frame(height: 48)
        .border(width: 0.5, edges: [.bottom], color: .gray.opacity(0.5))
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
