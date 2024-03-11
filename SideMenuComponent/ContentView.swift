//
//  ContentView.swift
//  SideMenuComponent
//
//  Created by vbugrym on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    ForEach(SideMenuOptionModel.allCases) { option in
                        HStack {
                            Image(systemName: option.systemImageName)
                            
                            Text(option.title)
                                .tag(option.rawValue)
                        }
                    }
                }
                
                SideMenuView(isShowing: $showMenu, 
                             selectedTab: $selectedTab)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    
    var navigationTitle: String {
        return SideMenuOptionModel(rawValue: selectedTab)?.title ?? "Home"
    }
}

#Preview {
    ContentView()
}
