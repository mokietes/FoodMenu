
import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        NavigationStack {
            VStack{
                Image ("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 3.0)
                    .frame(width: 120, height: 120)
                Spacer()
                
                VStack(spacing: 23){
                    
                    Input(text: $email, title: "Email Address", placeholder: "example@email.com")
                    Input(text: $password, title: "Password", placeholder:"Type your password")
                }
                .padding()
                
                //Sign in
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
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
                Spacer ()
                
                //sign up
                NavigationLink {
                    Registeration()
                }label: {
                    HStack {
                        Text("Don't have an account?")
                        Text ("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
            }
        }
    }
}

extension Login: AuthenticationForm {
    var formIsValid: Bool {
        return !email.isEmpty
        && !password.isEmpty
        && password.count > 5
        && email.contains("@")
    }
}

#Preview {
    Login()
}
