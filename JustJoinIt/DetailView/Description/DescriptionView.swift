//
//  DescriptionView.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 15/10/2022.
//

import SwiftUI

struct DescriptionView: View {
    let vm: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text("Description ")
                    .padding(.leading, 16)
                    .font(.headline)
                    .bold()
                if(vm.isRemoteInterview()) {
                    Text("Online Interview")
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 4.0)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(.blue)
                        .font(.system(size: 12))
                        .cornerRadius(4)
                }
                Spacer()
            }
            Divider()
                .padding(.vertical, 8.0)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(vm: DetailViewModel.mockVM())
    }
}
