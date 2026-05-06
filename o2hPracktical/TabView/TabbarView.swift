//
//  TabbarView.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import SwiftUI

enum Tabs: String, CustomStringConvertible {
    case photos
    case profile
    
    var description: String {
        switch self {
        case .photos:
            return "Photos"
        case .profile:
            return "Profile"
        }
    }
}

struct TabbarView: View {
    
    
    @State private var selectedTab: Tabs = .photos
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(Tabs.photos.description, systemImage: "photo.fill", value: .photos) {
                PhotoListView()
            }
            
            Tab(Tabs.profile.description, systemImage: "person.fill", value: .profile) {
                NavigationStack {
                    ProfileView()
                }
            }
        }
    }
}

#Preview {
    TabbarView()
}
