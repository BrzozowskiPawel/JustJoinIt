//
//  SplashScreen.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 17/10/2022.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text("justjoin.it")
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.system(size: 50))
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
