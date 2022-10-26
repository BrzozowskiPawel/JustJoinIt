//
//  IdentifiableSkill.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import Foundation

struct IdentifiableSkill: Identifiable {
    var id = UUID()
    let level: Int
    let name: String
    
    init(for skill: Skill) {
        self.level = skill.level
        self.name = skill.name
    }
}
