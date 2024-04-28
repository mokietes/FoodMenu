
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
                }
                
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

#Preview {
    Login()
}
