//
//  BookmarkView.swift
//  FoodMenu
//
//  Created by patron on 5/14/24.
//

// BookmarkView.swift

import SwiftUI

struct BookmarkView: View {
    @Binding var bookmarkedFoods: [FoodDetails]

    var body: some View {
        NavigationView {
            List(bookmarkedFoods) { food in
                VStack(alignment: .leading) {
                    Text(food.name).font(.headline)
                    Text("Brand: \(food.brand)")
                    Text("Category: \(food.category)")
                    Text("Ingredients: \(food.ingredients.joined(separator: ", "))")
                }
            }
            .navigationTitle("Bookmarks")
        }
    }
}

// Preview
#Preview {
    BookmarkView(bookmarkedFoods: .constant([]))
}

