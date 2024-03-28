//
//  ContentView.swift
//  FoodMenu
//
//  Created by patron on 3/23/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selectTab: Tab = .profile
    
    enum Tab {
        case profile
        case search
        case scan
    }
    
    var body: some View {
        TabView(selection: $selectTab){
            ProfileView() 
                .tabItem {
                Image (systemName: "person")
            }.tag(Tab.profile)
            SearchView ()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Tab")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search Tab")
    }
}

struct ScanView: View {
    var body: some View {
        Text("Scan Tab")
    }
}
#Preview {
    ContentView()
}
