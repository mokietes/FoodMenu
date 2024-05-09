//
//  AuthModel.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationForm {
    var formIsValid: Bool { get }
}

@MainActor
class AuthModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
        
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("Failed to login because \(error.localizedDescription)")
        }
    }
    
    func createUser (withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Error: failled to create user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() 
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            print("Error: No user is currently logged in")
            return
        }
        
        // Delete user from Firebase Authentication
        do {
            try await user.delete()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to delete user from Firebase Authentication: \(error.localizedDescription)")
            throw error
        }
        
        // Delete user data from Firestore
        let uid = user.uid
        let userRef = Firestore.firestore().collection("users").document(uid)
        
        do {
            try await userRef.delete()
            print("User data deleted from Firestore")
        } catch {
            print("Failed to delete user data from Firestore: \(error.localizedDescription)")
            throw error
        }
    }

    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("Error: Curent user is \(String(describing: self.currentUser))")
    }
    
}
