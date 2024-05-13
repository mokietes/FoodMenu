//
//  FoodScannerView.swift
//  FoodMenu
//
//  Created by patron on 5/10/24.
//

import SwiftUI
import CodeScanner

struct Food: Codable {
    let product: Product
    
    struct Product: Codable {
        let product_name: String
        let ingredients_text: String?
    }
}

struct FoodScannerView: View {
    
    @State private var scannedCode : String?
    @State private var food : Food?
    @State private var isLoading = false
    @State private var isPopoverVisible = false
    
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView( "Loading...")
                
            } else {
                if let food = food {
                    Text( "Product Name: \(food.product.product_name)")
                    if let ingredients = food.product.ingredients_text {
                        Text("Prduct Name = \(food.product.product_name)")
                    } else {
                        Text ( "Ingredients not available ")
                    }
                    Button("Details") {
                        isPopoverVisible.toggle()
                    }
                    .popover(isPresented: $isPopoverVisible, content: {
                        VStack {
                            Text ("Product Name: \(food.product.product_name)")
                            if let ingredients = food.product.ingredients_text {
                                Text("Ingredients: \(ingredients)")
                            } else {
                                Text ("Ingredients not available")
                            }
                            Button ("Close") {
                                isPopoverVisible.toggle()
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    })
                } else {
                    if let scannedCode = scannedCode {
                        Text("Scanned Code: \(scannedCode)")
                    }
                    Button("Scan") {
                        self.scannedCode = nil
                    }
                }
            }
        }
        .padding()
        .onAppear {
            self.scanBarcode()
        }
    }
    func scanBarcode(){
        CodeScannerView(codeTypes: [.ean8, .ean13, .pdf417] ) { result in
            switch result {
            case .success(let code):
                self.scannedCode = code
                self.fetchFoodDetails(barcode: code)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchFoodDetails(barcode: String) {
        isLoading = true
        let urlString = "https://world.openfoodfacts.org/api/v0/product/\(barcode).json"
        
        guard let url = URL(string: urlString) else {
                    print("Invalid URL")
                    isLoading = false
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    isLoading = false
                    
                    guard let data = data else {
                        print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let food = try decoder.decode(Food.self, from: data)
                        DispatchQueue.main.async {
                            self.food = food
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
                
                task.resume()
            }
}

#Preview {
    FoodScannerView()
}
