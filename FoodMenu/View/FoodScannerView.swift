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
                }
                .navigationTitle("FoodMenu")
                .toolbarTitleDisplayMode(.inline)
            }
        }

        func handleScan(result: Result<ScanResult, ScanError>) {
        }

        func fetchFoodDetails(barcode: String) {
        }
    }

    struct FoodDetails: Identifiable {
    }

    struct FoodData: Codable {
}


#Preview {
    FoodScannerView()
}
