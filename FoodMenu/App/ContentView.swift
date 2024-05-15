//
//  ContentView.swift
//  FoodMenu
//
//  Created by patron on 3/23/24.
//



import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                Tabview()
            } else {
                Login()
            }
        }
    }
}

#Preview {
    ContentView()
}

