//
//  BarberShop.swift
//  codeWithSwiftUI
//

//

import Foundation
class BarberShop: User {
    var shopName: String
    var phoneNumber: String
    var location: String?
    var avator: URL?
    var description: String?
    
    var photos: [URL]?
    var services: [String]?
    var barbers: [Barber]?
    
    var bankAccount: String?
    var orders: [Order]?
    
    var availableTime: String?
    var availableArea: String?
    
    init(id: UUID = UUID(), userNameToLogin: String, password: String, identity: Identity,
         shopName: String,
         phoneNumber: String
    ) {
        self.shopName = shopName
        self.phoneNumber = phoneNumber
        super.init(id: id, userNameToLogin: userNameToLogin, password: password, identity: identity)
    }
}
