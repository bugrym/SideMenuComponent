//
//  SideMenuRowView.swift
//  SideMenuComponent
//
//  Created by vbugrym on 07.03.2024.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(height: 44)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var isSelected: Bool {
        return selectedOption == option
    }
}

#Preview {
    SideMenuRowView(option: .dashboard, selectedOption: .constant(.dashboard))
}
