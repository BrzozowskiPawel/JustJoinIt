//
//  OfferDetailView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 08/10/2022.
//

import SwiftUI

struct OfferDetailView: View {
    let viewModel: OfferCellViewModel
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                VStack(alignment: .leading) {
                    NavigationButtons()
                        .padding(.vertical, 8)
                        .padding(.horizontal, 8)
                    
                    HStack (alignment: .center, spacing: 16) {
                        OfferLogo()
                        
                        OfferDetails(
                            title: viewModel.getTitle(),
                            street: viewModel.getStreet(),
                            location: viewModel.getLocation(),
                            workPlace: viewModel.getWorkplace())
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 120,
                        maxHeight: 120)
                    .padding(.horizontal, 8)
                    
                    
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.getEmploymentTypes(), id: \.self) {
                            SalaryText(text: $0)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
            .background(Color.random().gradient)
            
            InfoTails(vm: viewModel)
            
            Text("Salary chart")
            
            Text("Company info")
            
            Text("Map")
            
            Spacer()
        }
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferCellViewModel.mockVM())
    }
}

private struct InfoTails: View {
    let vm: OfferCellViewModel
    var body: some View {
        VStack(spacing: -1) {
            InfoTailRowComponent(
                firstTile: .companyName,
                secondTile: .companySize,
                vm: vm)
            InfoTailRowComponent(
                firstTile: .expLvl,
                secondTile: .added,
                vm: vm
            )
        }
    }
}
private struct InfoTailRowComponent: View {
    let firstTile, secondTile: InfoTailType
    let vm: OfferCellViewModel
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                InfoTailSingleComponent(
                    infoTailType: firstTile,
                    vm: vm)
                InfoTailSingleComponent(
                    infoTailType: secondTile,
                    vm: vm)
                    .padding(.leading, 6)
            }
            .padding(.top, 3)
            .padding(.horizontal, 6)
            .padding(.bottom, 3)
            .frame(minWidth: 0,
                   maxWidth: .infinity)
        }
        .background(.gray.opacity(0.1))
    }
}
enum InfoTailType {
    case companyName
    case companySize
    case expLvl
    case added
}
private struct InfoTailSingleComponent: View {
    let vm: OfferCellViewModel
    private let type: InfoTailType
    
    init(infoTailType: InfoTailType, vm: OfferCellViewModel) {
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
                value: vm.getHowOldOfferIs(),
                image: "clock.fill",
                color: .blue)
        }
    }
}

struct tailData {
    let name: String
    let value: String
    let image: String
    let color: Color
}

private struct SalaryText: View {
    let text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .font(.system(size: 17))
            .lineLimit(1)
    }
}
private struct NavigationButtons: View {
    var body: some View {
        HStack {
            Button {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "dismissModal"), object: nil)
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "paperplane")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        }
    }
}

private struct OfferLogo: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(.white)
            .padding(20)
            .background(Color.green)
            .clipShape(Circle())
    }
}

private struct OfferDetails: View {
    let title: String
    let street: String
    let location: String
    let workPlace: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .lineLimit(1)
            
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(street + ",")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                Text(location)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            
            Text(workPlace)
                .padding(.vertical, 2)
                .padding(.horizontal, 4)
                .font(.system(size: 12))
                .background(.white)
                .foregroundColor(.pink)
                .cornerRadius(4)
        }
        .padding(.vertical, 16)
    }
}
