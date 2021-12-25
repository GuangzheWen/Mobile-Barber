//
//  User.swift
//  codeWithSwiftUI
//

//

import Foundation

class User: Identifiable  {
    var id: UUID
    
    var userNameToLogin: String
    var password: String
    var identity: Identity
    
    
    var AppleIdToLogin: String?
    var GoogleIdToLogin: String?
    var FaceBookIdToLogin: String?
    
    init(id: UUID = UUID(), userNameToLogin: String, password: String, identity: Identity) {
        self.id = id
        self.userNameToLogin = userNameToLogin
        self.password = password
        self.identity = identity
    }
    
    
}
