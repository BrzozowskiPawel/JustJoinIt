//
//  TechStack.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 13/10/2022.
//

import SwiftUI
import QGrid

struct TechStack: View {
    let vm: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text("Tech stack")
                    .padding(.leading, 16)
                    .font(.headline)
                    .bold()
                Spacer()
            }
            Divider()
                .padding(.vertical, 3.0)
            
            QGrid(vm.getIdentifiableSkills(),
                  columns: 2,
                  vSpacing: 10,
                  hSpacing: 0,
                  vPadding: 10,
                  hPadding: 0) { item in
                TechStackCell(skill: item)
            }
            .frame(height: vm.getTechStackHeight())
            
        }
    }
}

class IdentifiableSkill: Identifiable {
    private let name: String
    private let level: Int
    
    init(skill: Skill) {
        self.name = skill.name
        self.level = skill.level
    }
    
    func getSeniority() -> String {
        print("\(name) Level: \(level)")
        switch level {
        case 1:
            return "Nice to have"
        case 2:
            return "Junior"
        case 3:
            return "Regular"
        case 4:
            return "Advanced"
        case 5:
            return "Master"
        default:
            return "Error: lvl= \(level)"
        }
    }
    
    func getName() -> String {
        return name
    }
    
    func getLevel() -> Int {
        return level
    }

}

struct TechStack_Previews: PreviewProvider {
    static var previews: some View {
        TechStack(vm: DetailViewModel.mockVM())
    }
}

struct TechStackCell: View {
    let skill: IdentifiableSkill
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                TechnologyDotIndicator(
                    level: skill.getLevel())
                Text(skill.getName())
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text(skill.getSeniority())
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 16)
            Spacer()
        }
    }
}

struct TechnologyDotIndicator: View {
    let level: Int
    var body: some View {
        
        HStack {
            ForEach((1...5), id: \.self) { index in
                Circle()
                    .fill(level >= index ? .red : .gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

