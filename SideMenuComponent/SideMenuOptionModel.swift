//
//  SideMenuOptionModel.swift
//  SideMenuComponent
//
//  Created by vbugrym on 07.03.2024.
//

import SwiftUI

enum SideMenuSectionModel: Int, CaseIterable {
    case analytics
    case profile
    
    var options: [SideMenuOptionModel] {
        switch self {
        case .analytics:
            return [.dashboard, .performance]
        case .profile:
            return [.profile, .search, .notifications]
        }
    }
    
    var title: String {
        switch self {
        case .analytics:
            return "Analytics"
        case .profile:
            return "Profile"
        }
    }
}

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case search
    case notifications
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        }
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .search:
            return "Search"
        case .notifications:
            return "Notifications"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {
        self.rawValue
    }
}

extension SideMenuSectionModel: Identifiable {
    var id: Int {
        self.rawValue
    }
}
