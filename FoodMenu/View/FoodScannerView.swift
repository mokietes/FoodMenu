//
//  FoodScannerView.swift
//  FoodMenu
//
//  Created by patron on 5/10/24.
//

import SwiftUI

struct FoodScannerView: View {
    
    @State private var scannedCode : String?
    @State private var food: Food?
    @State private var isLoading = false
    @State private var isPopoverVisible = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView( "Loading...")
                
            } else {
                if let food = food {
                    Text( "Product Name: \(food.product_name)")
                    if let ingredients = food.product.ingredients_text {
                        Text("Prduct Name = \(food.product.product_name)")
                    }else {
                            Text ( "Ingredients not available ")
                        }
                        Button("Details") {
                            isPopoverVisible.toggle()
                        }
                        .popover(isPresented: $isPopoverVisible, content: {
                            VStack {
                                Text ("Ingredients: \(ingredients)")
                            } else {
                                Text ("Ingredients not available")
                            }
                            Button ("Close") {
                                isPopoverVisible.toggle()
                            }
                        })
                    }
                        
                }
            }
        }
    }


#Preview {
    FoodScannerView()
}
