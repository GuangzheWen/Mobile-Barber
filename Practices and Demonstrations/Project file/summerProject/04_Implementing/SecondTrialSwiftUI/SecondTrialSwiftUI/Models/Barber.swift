//
//  Barber.swift
//  codeWithSwiftUI
//

//

import Foundation
struct Barber: Identifiable {
    let id: UUID
    var barberName: String
    var serviceTypes: [String]
    var position: String
//    var profile: objc_func_loadImage
    
    init(id: UUID = UUID(), barberName: String, serviceTypes:[String], position: String) {
            self.id = id
        self.barberName = barberName
        self.serviceTypes = serviceTypes
        self.position = position
    }
}

extension Barber {
    static var data: [Barber] {
        [
            Barber(barberName: "Barber 1", serviceTypes: ["Service 1","Service 2","Service 3", ], position: "Temple"),
            Barber(barberName: "Barber 2", serviceTypes: ["Service 1","Service 2","Service 3", ], position: "Temple 1"),
            Barber(barberName: "Barber 3", serviceTypes: ["Service 1","Service 2","Service 3", ], position: "Temple 2")
        ]
    }
}

class BarberNew: User{
    var barberName: String
    var phoneNumber: String
    var servicesCanDo: [String]?
    var description: String?
    
    var barberShop: BarberShop
    
    init(id: UUID = UUID(), userNameToLogin: String, password: String, identity: Identity, barberName: String, phoneNumber: String, barberShop: BarberShop) {
        self.barberName = barberName
        self.phoneNumber = phoneNumber
        self.barberShop = barberShop
        
        super.init(id: id, userNameToLogin: userNameToLogin, password: password, identity: identity)
       
    }
}
