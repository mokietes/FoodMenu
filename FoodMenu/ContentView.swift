//
//  ContentView.swift
//  FoodMenu
//
//  Created by patron on 3/23/24.
//

import SwiftUI
enum Tab {
    case profile
}

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileView()
                .tabItem{
                    
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
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
