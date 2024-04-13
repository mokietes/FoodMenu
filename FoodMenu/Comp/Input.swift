//
//  Input.swift
//  FoodMenu
//
//  Created by patron on 4/12/24.
//

import SwiftUI


struct Input: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                
            }else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                
            }
            Divider()
        }
    }
}

#Preview {
    Input(text: .constant(""), title: "Email", placeholder: "name@example.com")
}
