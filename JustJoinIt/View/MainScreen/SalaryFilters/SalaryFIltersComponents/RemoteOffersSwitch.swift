//
//  RemoteOffers.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 12/11/2022.
//

import SwiftUI

struct RemoteOffersSwitch: View {
    @State private var isSelected: Bool = false
    var body: some View {
        HStack {
            Text("Remote")
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .fontWeight(.semibold)
            Toggle("Remote", isOn: $isSelected)
                .labelsHidden()
        }
    }
}

struct RemoteOffers_Previews: PreviewProvider {
    static var previews: some View {
        RemoteOffersSwitch()
    }
}
