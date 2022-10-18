//
//  OfferInfoMainPanel.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 19/10/2022.
//

import SwiftUI

struct OfferInfoMainPanel: View {
    private let title: String
    private let salary: String
    
    init(title: String, salary: String) {
        self.title = title
        self.salary = salary
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .fontWeight(.medium)
                .font(.system(size: 14))
                .lineLimit(1)
            
            Spacer()
            Text(salary)
                .foregroundColor(.green)
                .font(.system(size: 12))
        }
        .padding(.vertical, 8)
    }
}

struct OfferInfoMainPanel_Previews: PreviewProvider {
    static var previews: some View {
        let vm = OfferListCellViewModel.mockVM()
        OfferInfoMainPanel(
            title: vm.getOfferTitle(),
            salary: vm.getSalary())
    }
}

//private struct OfferMainInfo: View {
//    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
//
//    let vm: OfferListCellViewModel
//    var body: some View {
//        VStack (alignment: .leading){
//
//            Button(vm.getOfferTitle()) {
//                Task {
//                    do {
//                        let url = URLs.detailOffer(for: vm.getID())
//                        let detailOffer = try await NetworkManager.shared.getDetailOffer(atUrl: url)
//
//                        let detailVM = DetailViewModel(offer: detailOffer)
//                        self.viewControllerHolder?.present(style: .fullScreen) {
//                            Text("Detail View")
//                        }
//                    }
//                    catch {
//                        print("❌ Error - \(error.localizedDescription)")
//                    }
//                }
//            }
//            .fontWeight(.medium)
//            .font(.system(size: 14))
//            .lineLimit(1)
//
//            Spacer()
//            Text(vm.getSalary())
//                .foregroundColor(.green)
//                .font(.system(size: 12))
//        }
//    }
//}
