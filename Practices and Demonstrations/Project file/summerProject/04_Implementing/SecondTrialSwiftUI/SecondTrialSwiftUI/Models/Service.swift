//
//  Service.swift
//  codeWithSwiftUI
//

//

import Foundation
class Service {
    var id: UUID
    var serviceName: String
    var genderType: String?
    var price: Double
    var description: String?
    
    var photoDemos: [URL]?
    
    var availableVouchers: String?
    
    init(id: UUID = UUID(), serviceName: String, price: Double) {
        self.id = id
        self.serviceName = serviceName
        self.price = price
    }
}
