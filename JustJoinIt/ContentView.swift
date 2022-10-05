//
//  ContentView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var offers = [Offer]()
    
    var body: some View {
        VStack {
            Text("Curently \($offers.count) offers.")
            Button {
                Task {
                    do {
                        offers = try await NetworkManager.shared.getOffers(atUrl: RepoURL.offers)
                    }
                    catch {
                        print("❌ Error - \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("FETCH!")
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .background(.green.gradient)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
