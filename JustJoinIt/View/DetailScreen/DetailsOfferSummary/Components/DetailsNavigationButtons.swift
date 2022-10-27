//
//  DetailsNavigationButtons.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 23/10/2022.
//

import SwiftUI

struct DetailsNavigationButtons: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
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

struct DetailsNavigationButtons_Previews: PreviewProvider {
    static var previews: some View {
        DetailsNavigationButtons()
    }
}
