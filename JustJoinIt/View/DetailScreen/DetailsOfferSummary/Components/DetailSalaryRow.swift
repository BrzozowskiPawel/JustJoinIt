//
//  DetailSalaryRow.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 23/10/2022.
//

import SwiftUI

struct DetailSalaryRow: View {
    let text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .font(.system(size: 17))
            .lineLimit(1)
    }
}

//struct DetailSalaryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailSalaryRow()
//    }
//}
