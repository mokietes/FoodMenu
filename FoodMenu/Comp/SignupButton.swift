//
//  SignupButton.swift
//  FoodMenu
//
//  Created by patron on 4/12/24.
//

import SwiftUI

struct SignupButton: View {
    let text: String
    let name: String
    
    var body: some View {
        Button {
            print(text)
        } label: {
            Text(name)
                .fontWeight(.semibold)
            Image(systemName: "arrow.right")
        }
        .fontWeight(.semibold)
    }
}

#Preview {
    SignupButton( text: "Log user in...", name: "Signup")
}



