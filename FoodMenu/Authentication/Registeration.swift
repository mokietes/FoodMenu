//
//  Registeration.swift
//  FoodMenu
//
//  Created by patron on 4/12/24.
//

import SwiftUI

struct Registeration: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image ("logo")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 4)
                .frame(width: 120, height: 120)
            
            VStack (spacing: 23) {
                Input (text: $email, title: "Email Address", placeholder: "example@email.com")
                Input (text: $fullname, title: "Full Name", placeholder: "Enter your name")
                Input (text: $password, title: "password", placeholder: "Enter your password", isSecureField: true)
                Input (text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password")
            }
            .padding()
            SignupButton(text: "SIGN UP", name: "SIGN Up")
        }
        
        Spacer()
        
        Button {
            dismiss()
        }  label: {
                HStack (spacing: 3) {
                    Text("Already have an account?")
                    Text ("Sign in")
                        .fontWeight(.bold)
                        
                }
                .font(.system(size: 14))
            }
        }
    }


#Preview {
    Registeration()
}
