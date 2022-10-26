//
//  IdentifiableSkill.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import Foundation

class IdentifiableSkillViewModel: Identifiable {
    private let skill: IdentifiableSkill
    
    init(skill: IdentifiableSkill) {
        self.skill = skill
    }
    
    func getSeniority() -> String {
        switch skill.level {
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
            return "Error: lvl= \(skill.level)"
        }
    }
    
    func getName() -> String {
        return skill.name
    }
    
    func getLevel() -> Int {
        return skill.level
    }

}
