
import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack{
                Image ("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 4)
                    .frame(width: 120, height: 120)
                
                
                VStack(){
                    
                    Input(text: $email, title: "Email Address", placeholder: "example@email.com")
                    Input(text: $password, title: "Password", placeholder:"Type your password")
                }
                .padding()
                
                Button {
                    print("Log user in")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }
                
                Spacer ()
                
            }
        }
    }
}

#Preview {
    Login()
}
