//
//  SideMenuView.swift
//  SideMenuComponent
//
//  Created by vbugrym on 06.03.2024.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var width: CGFloat = 0
    @State var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        List {
                            ForEach(SideMenuSectionModel.allCases) { section in
                                Section(section.title) {
                                    ForEach(section.options) { option in
                                        Button {
                                            selectedOption = option
                                            selectedTab = option.rawValue
                                            isShowing.toggle()
                                        } label: {
                                            SideMenuRowView(option: option,
                                                            selectedOption: $selectedOption)
                                        }
                                        .foregroundStyle(.black)
                                    }
                                }
                                .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(.plain)
                
                        Spacer()
                    }
                    .padding()
                    .frame(width: width * 0.7, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .modifier(GetWidthModifier(width: $width))
        .animation(.easeInOut, value: isShowing)
    }
}

struct GetWidthModifier: ViewModifier {
    @Binding var width: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    width = geo.size.width
                }
                return Color.clear
            }
        )
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
