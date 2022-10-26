//
//  TechStack.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 26/10/2022.
//

import SwiftUI
import QGrid

struct TechStack: View {
    private let vm: DetailViewModel
    
    init(for vm: DetailViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text("Tech stack")
                    .font(.system(size: 26))
                    .padding(.leading, 16)
                    .font(.headline)
                    .bold()
                Spacer()
            }
            Divider()
                .padding(.vertical, 8.0)
            
            QGrid(vm.getSkills(),
                  columns: 2,
                  vSpacing: 10,
                  hSpacing: 0,
                  vPadding: 10,
                  hPadding: 0) { item in
                TechStackCell(for: item)
            }
            .frame(height: vm.getTechStackHeight())
            
        }
    }
}
