//
//  FoodMenuApp.swift
//  FoodMenu
//
//  Created by patron on 3/23/24.
//

import SwiftUI
import Firebase

@main
struct FoodMenuApp: App {
    @StateObject var viewModel = AuthModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
