//
//  TechStackCell.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI

struct TechStackCell: View {
    private let vm: IdentifiableSkillViewModel
    
    init(for skill: IdentifiableSkill) {
        self.vm = IdentifiableSkillViewModel(skill: skill)
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                TechnologyDotIndicator(
                    level: vm.getLevel())
                Text(vm.getName())
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text(vm.getSeniority())
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 16)
            Spacer()
        }
    }
}
