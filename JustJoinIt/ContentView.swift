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
        if $offers.count > 0 {
            VStack {
                VStack {
                    TopBarView()
                    FiltersView()
                    
                    Text("Curently \($offers.count) offers.")
                    OffersTable(offersArray: offers)
                }
            }
        } else {
            ZStack {
                Color.white.ignoresSafeArea()
                Text("justjoin.it")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 50))
            }
            .onAppear {
                Task {
                    do {
                        offers = try await NetworkManager.shared.getOffers(atUrl: RepoURL.offers)
                    }
                    catch {
                        print("❌ Error - \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
