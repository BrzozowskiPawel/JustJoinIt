//
//  UkraineFriendlyOffers.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct UkraineFriendlyOffers: View {
    @State private var showUkraine: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Show only friendly offers")
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Text("🇺🇦")
                    .font(.system(size: 24))
                    .padding(.horizontal, 8)
                Spacer()
                Toggle("dark-mode", isOn: $showUkraine)
                    .labelsHidden()
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .padding(.top, 10)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct UkraineFriendlyOffers_Previews: PreviewProvider {
    static var previews: some View {
        UkraineFriendlyOffers()
    }
}
