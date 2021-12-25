//
//  Customer.swift
//  codeWithSwiftUI
//

//

import Foundation

class Customer: User {
    var customerName: String
    
    var phoneNumber: String
    var email: String?
    var address: String?
    var gender: String?
    var avatar: URL?
    var age: Int?
    
    var paymentMethod: String?
    
    var orders: [Order]?
    
    var favoriteBarbers: [Barber]?
    var favoriteBarberShops: [BarberShop]?
    
    var vouchers: [String]?
    
    init(id: UUID = UUID(), userNameToLogin: String, password: String, identity: Identity,
         customerName: String, phoneNumber: String
         ) {
        self.customerName = customerName
        self.phoneNumber = phoneNumber
        
        super.init(id: id, userNameToLogin: userNameToLogin, password: password, identity: identity)
    }
}
