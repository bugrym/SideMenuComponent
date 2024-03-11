//
//  SideMenuHeaderView.swift
//  SideMenuComponent
//
//  Created by vbugrym on 06.03.2024.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Blue Moorey")
                    .font(.subheadline)
                Text("b.moorey@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
