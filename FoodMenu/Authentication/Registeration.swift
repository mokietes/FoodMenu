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
    @EnvironmentObject var viewModel: AuthModel
    
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
                Input (text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
            }
            .padding()
            
            //SignupButton(text: "SIGN UP", name: "SIGN Up")
            Button {
                Task{
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(12)
                .padding(.top, 4)
            
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

extension Registeration: AuthenticationForm {
    var formIsValid: Bool {
        return !email.isEmpty
        && !password.isEmpty
        && password.count > 5
        && email.contains("@")
        && !fullname.isEmpty
        && confirmPassword == password
    }
}

#Preview {
    Registeration()
}
