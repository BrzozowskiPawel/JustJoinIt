//
//  FilterTechButton.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 31/10/2022.
//

import SwiftUI

struct FilterTechButton: View {
    @State private var isSelected: Bool = false
    @State private var selectedTech: TechType? = nil
    
    var body: some View {
        Button {
            self.isSelected.toggle()
        } label: {
            if (selectedTech != nil) {
                HStack {
                    Image(systemName: selectedTech!.imageName)
                    Text(selectedTech!.techName)
                }
                .padding(.vertical, 6.0)
                .padding(.horizontal, 12.0)
                .background( Color.pink.opacity(0.2))
                .foregroundColor(.pink)
            } else {
                Text("Tech")
                    .padding(.vertical, 6.0)
                    .padding(.horizontal, 12.0)
                    .background(.white)
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        }
        .cornerRadius(16)
        .sheet(isPresented: $isSelected) {
            VStack(spacing: 0) {
                HStack {
                    Text("Technology")
                        .font(.system(size: 23))
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer()
                    Button {
                        isSelected = false
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .border(
                    width: 0.5,
                    edges: [.bottom,.top],
                    color: .gray)
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(TechType.allValues(), id: \.self.techName) { techType in
                            TechButtonCell(techType)
                                .onTapGesture {
                                    selectedTech = techType
                                    isSelected = false
                                }
                        }
                    }
                }
            }
        }

    }
}

struct FilterTechButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterTechButton()
    }
}
