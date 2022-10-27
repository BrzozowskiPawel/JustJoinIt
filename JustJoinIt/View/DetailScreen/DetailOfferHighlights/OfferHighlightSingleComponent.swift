//
//  OfferHighlightSingleComponent.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI

struct tailData {
    let name: String
    let value: String
    let image: String
    let color: Color
}

struct OfferHighlightSingleComponent: View {
    let vm: DetailViewModel
    private let type: InfoTailType
    
    init(infoTailType: InfoTailType, vm: DetailViewModel) {
        self.type = infoTailType
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            let data = getInfoTileData(for: type)
            Image(systemName: data.image)
              .resizable()
              .frame(width: 12, height: 12)
              .foregroundColor(data.color)
              .padding(8)
              .background(.gray.opacity(0.2))
              .clipShape(Circle())
            Text(data.value)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .lineLimit(1)
            Text(data.name)
                .fontWeight(.light)
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .lineLimit(1)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 80,
               maxHeight: 80)
        .background(.white)
        .cornerRadius(8)
    }
    
    private func getInfoTileData(for infoTailType: InfoTailType) -> tailData {
        switch infoTailType {
        case .companyName:
            return tailData(
                name: "Company Name",
                value: vm.getCompanyName(),
                image: "building.2",
                color: .red)
        case .companySize:
            return tailData(
                name: "Company Size",
                value: vm.getCompanySize(),
                image: "person.2.fill",
                color: .orange)
        case .expLvl:
            return tailData(
                name: "Exp. lvl",
                value: vm.getExp().uppercased(),
                image: "chart.line.uptrend.xyaxis",
                color: .green)
        case .added:
            return tailData(
                name: "Added",
                value: vm.getOfferAge(),
                image: "clock.fill",
                color: .blue)
        }
    }
}

struct OfferHighlightSingleComponent_Previews: PreviewProvider {
    static var previews: some View {
        OfferHighlightSingleComponent(
            infoTailType: .companyName,
            vm: DetailViewModel.mockVM())
    }
}
