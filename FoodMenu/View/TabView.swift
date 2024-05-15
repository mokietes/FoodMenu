//
//  TabView.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import SwiftUI


struct Tabview: View {

    @State private var selectTab: Tab = .profileView

        enum Tab {
        case scan
        case search
        case profileView
    }

    var body: some View {
        TabView(selection: $selectTab){
            FoodScannerView()
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("scan")
            }
                .tag(Tab.scan)
            
            BookmarkView ()
                .tabItem {
                    Image(systemName: "bookmark")
                }
            Profile()
                .tabItem {
                Image (systemName: "person")
            }.tag(Tab.profileView)
            
        }
    }
}


#Preview {
    Tabview()
}

