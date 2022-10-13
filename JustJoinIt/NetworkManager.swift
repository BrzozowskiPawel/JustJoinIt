//
//  JustJoinItApp.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 05/10/2022.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    let decoder = JSONDecoder()

    func getOffers(atUrl urlString: String) async throws -> [Offer] {
        print("➡️ in getOffer")
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRepoURL
        }

        print("➡️ got URL")
        
        let (data, response) = try await URLSession.shared.data(from: url)

        print("➡️ URL session")
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        print("➡️ get respoinse: \(response.statusCode)")
        
        do {
            let start = CFAbsoluteTimeGetCurrent()
            
            let offers = try decoder.decode([Offer].self, from: data)
            
            let diff = CFAbsoluteTimeGetCurrent() - start
            print("✅DONE: Took \(diff) seconds")
            
            return offers.filter { $0.display_offer }
            
        } catch let DecodingError.dataCorrupted(context) {
            print("❌ \(context)")
            throw NetworkError.invalidRepoData
        } catch let DecodingError.keyNotFound(key, context) {
            print("❌  Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch let DecodingError.valueNotFound(value, context) {
            print("❌  Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch let DecodingError.typeMismatch(type, context)  {
            print("❌  Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch {
            print("❌  error: ", error)
            throw NetworkError.invalidRepoData
        }
    }
    
    func getDetailOffer(atUrl urlString: String) async throws -> DetailOffer {
        print("➡️ in getOffer")
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRepoURL
        }

        print("➡️ got URL: \(urlString)")
        
        let (data, response) = try await URLSession.shared.data(from: url)

        print("➡️ URL session")
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        print("➡️ get respoinse: \(response.statusCode)")
        
        do {
            let start = CFAbsoluteTimeGetCurrent()
            
            let detailOffer = try decoder.decode(DetailOffer.self, from: data)
            
            let diff = CFAbsoluteTimeGetCurrent() - start
            print("✅DONE: Took \(diff) seconds")
            
            return detailOffer
            
        } catch let DecodingError.dataCorrupted(context) {
            print("❌ (1.) \(context)")
            throw NetworkError.invalidRepoData
        } catch let DecodingError.keyNotFound(key, context) {
            print("❌  (2.) Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch let DecodingError.valueNotFound(value, context) {
            print("❌  (3.) Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch let DecodingError.typeMismatch(type, context)  {
            print("❌  (4.) Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkError.invalidRepoData
        } catch {
            print("❌  (5.) error: ", error)
            throw NetworkError.invalidRepoData
        }
    }
}


enum NetworkError: Error {
    case invalidRepoURL
    case invalidResponse
    case invalidRepoData
}

struct URLs {
    static func offers() -> String {
        return "https://justjoin.it/api/offers"
    }
    static func detailOffer(for id: String) -> String {
        return "https://justjoin.it/api/offers/\(id)"
    }
}
