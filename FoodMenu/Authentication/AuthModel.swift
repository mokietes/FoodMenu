//
//  AuthModel.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import Foundation
import Firebase

class AuthModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
        
    func signIn(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser (withEmail email: String, password: String, fullname: String) async throws{
        
    }
    
    func signOut() {
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        
    }
    
}
