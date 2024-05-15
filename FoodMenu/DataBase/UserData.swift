//
//  UserData.swift
//  FoodMenu
//
//  Created by patron on 4/27/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id:String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
            
        }
        return ""
    }
}

extension User {
    static var TEST_USER = User(id: NSUUID().uuidString, fullname: "test Tes", email: "test@gamil.com")
}
