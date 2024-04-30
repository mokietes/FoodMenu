//
//  TabView.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import SwiftUI


struct Tabview: View {

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

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: String
    var instruction: String
}

struct ProfileView: View {

    @State private var newRecipeName: String = ""
    @State private var newRecipeIngredients: String = ""
    @State private var newRecipeInstruction: String = ""
    @State private var savedRecepies: [Recipe] = []

    var body: some View {
        VStack {
            TextField("Recipe Name", text: $newRecipeName)
                .padding()
            TextField("Ingredients", text: $newRecipeIngredients)
                .padding()
            TextField("Instructions", text: $newRecipeInstruction)
                .padding()
            Button ("Save Recipe") {
                let newRecipe = Recipe(name: newRecipeName, ingredients: newRecipeIngredients, instruction: newRecipeIngredients)
                savedRecepies.append(newRecipe)


                newRecipeName = ""
                newRecipeIngredients = ""
                newRecipeInstruction = ""
            }
            .padding()

            List(savedRecepies, id: \.id) { recipe in
                VStack(alignment: .leading ) {
                    Text(recipe.name)
                        .font(.headline)
                    Text ("Ingredients: \(recipe.ingredients)")
                        .font(.subheadline)
                }
            }
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
    Tabview()
}

