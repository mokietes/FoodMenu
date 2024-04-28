//
//  FoodMenuApp.swift
//  FoodMenu
//
//  Created by patron on 3/23/24.
//

import SwiftUI

@main
struct FoodMenuApp: App {
    @StateObject var viewModel = AuthModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
