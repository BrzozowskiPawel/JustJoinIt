//
//  DetailOfferSummary.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 23/10/2022.
//

import SwiftUI

struct DetailOfferInfo: View {
    let title: String
    let street: String
    let location: String
    let workPlace: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .lineLimit(1)
            
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(street + ",")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(location)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            
            Text(workPlace)
                .padding(.vertical, 2)
                .padding(.horizontal, 4)
                .font(.system(size: 12))
                .background(.white)
                .foregroundColor(.pink)
                .cornerRadius(4)
        }
        .padding(.vertical, 16)
    }
}

//struct DetailOfferInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailOfferInfo()
//    }
//}
