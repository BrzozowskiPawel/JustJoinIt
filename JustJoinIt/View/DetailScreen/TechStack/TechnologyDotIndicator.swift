//
//  TechnologyDotIndicator.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI

struct TechnologyDotIndicator: View {
    let level: Int
    var body: some View {
        
        HStack {
            ForEach((1...5), id: \.self) { index in
                Circle()
                    .fill(level >= index ? .red : .gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct TechnologyDotIndicator_Previews: PreviewProvider {
    static var previews: some View {
        TechnologyDotIndicator(level: 3)
    }
}
