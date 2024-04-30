//
//  AuthModel.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
        
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in..")
    }
    
    func createUser (withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("Error: failled to create user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        
    }
    
}
