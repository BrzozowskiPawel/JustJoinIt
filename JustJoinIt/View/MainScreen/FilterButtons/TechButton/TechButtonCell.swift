//
//  TechButtonCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

struct TechButtonCell: View {
    private let techType: TechType
    
    init(_ techType: TechType) {
        self.techType = techType
    }
    
    var body: some View {
        HStack {
            Image(systemName: techType.imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
                .padding(.trailing, 8)
            Text(techType.techName)
                .font(.system(size: 20))
            Spacer()
        }
        .frame(height: 40)
        .padding(.vertical, 4)
        .padding(.leading, 16)
    }
}

struct TechButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        TechButtonCell(TechType(.Mobile))
    }
}
