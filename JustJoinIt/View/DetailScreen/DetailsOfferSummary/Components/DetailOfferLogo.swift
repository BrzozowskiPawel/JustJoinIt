//
//  DetailOfferLogo.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 23/10/2022.
//

import SwiftUI

struct DetailOfferLogo: View {
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

struct DetailOfferLogo_Previews: PreviewProvider {
    static var previews: some View {
        DetailOfferLogo()
    }
}
