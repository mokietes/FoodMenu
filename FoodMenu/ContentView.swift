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
            ScanView()
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("scan")
            }
                .tag(Tab.scan)
        }
    }
}

struct ProfileView: View {
    
    @State private var newRecipeName: String = ""
    @State private var newRecipeIngredients: String = ""
    @State private var newRecipeInstruction: String = ""
    @State private var savedRecepies: String = ""
    
    var body: some View {
        VStack {
            TextField("Recipe Name", text: $newRecipeName)
                .padding()
        }
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
