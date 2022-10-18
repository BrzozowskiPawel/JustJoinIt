//
//  JustJoinItApp.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 05/10/2022.
//

import SwiftUI

@main
struct JustJoinItApp: App {
    @State private var offers = [Offer]()
    
    var body: some Scene {
        WindowGroup {
            if $offers.count > 0 {
                MainScreen(with: offers)
            }else {
                SplashScreen()
                    .onAppear {
                        Task {
                            do {
                                offers = try await NetworkManager.shared.getOffers(atUrl:URLs.offers())
                            }
                            catch {
                                print("❌ Error - \(error.localizedDescription)")
                            }
                        }
                    }
            }
        }
    }
}
