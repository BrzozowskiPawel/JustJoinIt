//
//  MapButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 27/10/2022.
//

import SwiftUI

struct MapButton: View {
    @State private var presentMap = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Map")
                .foregroundColor(.white)
                .font(.system(size: 20,
                              weight: .light))
                .frame(width: 70, height: 35)
                .background(.black)
                .cornerRadius(15)
                .padding(.bottom, 45)
        }
        .sheet(isPresented: $presentMap) {
            Text("Present Map")
        }
        .onTapGesture {
            presentMap.toggle()
        }
    }
}

struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton()
    }
}
