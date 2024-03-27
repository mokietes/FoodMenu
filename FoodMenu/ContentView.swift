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
        TabView(selection: $selectTab,
                content:  {
            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            Text("Tab Content 2").tabItem { Text("Tab Label 3") }.tag(3)
        })
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
