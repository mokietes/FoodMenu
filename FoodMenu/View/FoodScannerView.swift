//
//  FoodScannerView.swift
//  FoodMenu
//
//  Created by patron on 5/10/24.
//

// FoodScannerView.swift

import SwiftUI
import CodeScanner

struct FoodScannerView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var foodDetails: FoodDetails?

        var body: some View {
            NavigationView {
                VStack {
                    if let foodDetails = foodDetails {
                        Text("Name: \(foodDetails.name)")
                        Text("Brand: \(foodDetails.brand)")
                        Text("Category: \(foodDetails.category)")
                        Text("Ingredients: \(foodDetails.ingredients.joined(separator: ", "))")
                    } else {
                        Text("Scan a food barcode to get details")
                    }
                    Button("Scan Barcode") {
                        isPresentingScanner = true
                    }
                    .sheet(isPresented: $isPresentingScanner) {
                        CodeScannerView(
                            codeTypes: [.ean13, .ean8, .upce],
                            completion: handleScan
                        )
                    }
                }
                .navigationTitle("FoodMenu")
                .toolbarTitleDisplayMode(.inline)
            }
        }

        func handleScan(result: Result<ScanResult, ScanError>) {
            isPresentingScanner = false
            switch result {
            case .success(let scanResult):
                scannedCode = scanResult.string
                fetchFoodDetails(barcode: scanResult.string)
            case .failure(let error):
                print("Scanning failed: \(error.localizedDescription)")
            }
        }

        func fetchFoodDetails(barcode: String) {
            guard let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/\(barcode).json") else {
                print("Invalid URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let foodData = try? decoder.decode(FoodData.self, from: data) {
                        DispatchQueue.main.async {
                            self.foodDetails = FoodDetails(from: foodData.product)
                        }
                    } else {
                        print("Failed to decode response")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
        }
    }

    struct FoodDetails: Identifiable {
        var id = UUID()
        var name: String
        var brand: String
        var category: String
        var ingredients: [String]

        init(from product: FoodData.Product) {
            self.name = product.product_name ?? "Unknown"
            self.brand = product.brands ?? "Unknown"
            self.category = product.categories?.components(separatedBy: ", ").first ?? "Unknown"
            self.ingredients = product.ingredients_text?.components(separatedBy: ", ") ?? []
        }
    }

    struct FoodData: Codable {
}


#Preview {
    FoodScannerView()
}
