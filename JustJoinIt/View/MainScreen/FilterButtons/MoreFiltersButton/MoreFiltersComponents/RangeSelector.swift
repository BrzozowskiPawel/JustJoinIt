//
//  Slider.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import SwiftUI

enum RangeValue {
    case min
    case max
}

struct RangeSelector: View {
    @State var width1: CGFloat = 0
    @State var width2: CGFloat = UIScreen.main.bounds.width - 60
    let maxRangeNumber: CGFloat = 100.0
    var totalWidth = UIScreen.main.bounds.width - 60

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Salary expectations?")
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Spacer()
            }
            VStack{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.purple.opacity(0.2))
                        .frame(height: 3)
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: self.width2 - self.width1, height: 3)
                        .offset(x: self.width1 + 15)
                    
                    HStack(spacing: 0){
                        Circle()
                            .fill(Color.purple)
                            .frame (width: 15, height: 15)
                            .offset(x: self.width1)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        if value.location.x >= 0 && value.location.x < self.width2 {
                                            self.width1 = value.location.x
                                        }
                                    })
                            )
                        Circle()
                            .fill(Color.purple)
                            .frame (width: 15, height: 15)
                            .offset(x: self.width2)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        if value.location.x <= self.totalWidth && value.location.x > self.width1 {
                                            self.width2 = value.location.x
                                        }
                                    })
                            )
                    }
                }
                
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Min. ammount")
                    Text(getValue(.min))
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                            .stroke(.gray, lineWidth: 1))
                
                Spacer()
                
                Rectangle()
                    .frame(width: 16, height: 2)
                    .foregroundColor(.gray)
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Max. ammount")
                    Text(getValue(.max))
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                            .stroke(.gray, lineWidth: 1))
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .padding(.top, 10)
                .foregroundColor(.gray)
            
        }.padding()
    }
    
    private func getValue(_ rangeValue: RangeValue) -> String {
        switch rangeValue {
        case .min:
            let value = self.width1 / self.totalWidth * maxRangeNumber
            let roundedValue = Int(round(value) * 1000)
            return "\(roundedValue) PLN"
        case .max:
            let value = self.width2 / self.totalWidth * maxRangeNumber
            let roundedValue = Int(round(value) * 1000)
            return "\(roundedValue) PLN"
        }
    }
}

struct RangeSelector_Previews: PreviewProvider {
    static var previews: some View {
        RangeSelector()
    }
}
