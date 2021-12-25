//
//  Appointment.swift
//  codeWithSwiftUI
//

//

import Foundation
import SwiftUI

struct Appointment: Identifiable{
    let id: UUID
    var custumerName: String
    var barberName: String
    var serviceType: String
    var appointmentDate: Date
    var serviceCost: Double
    var color: Color
    
    var address: String
    var phoneNumber: String
    
    init(id: UUID = UUID(), custumerName: String, barberName: String, serviceType: String, appointmentDate: Date, serviceCost: Double, color: Color, address: String, phoneNumber: String) {
            self.id = id
            self.custumerName = custumerName
            self.barberName = barberName
            self.serviceType = serviceType
            self.appointmentDate = appointmentDate
            self.serviceCost = serviceCost
            self.color = color
            self.address = address
            self.phoneNumber = phoneNumber
        }
}


extension Appointment {
    static var data: [Appointment] {
        [
            Appointment(custumerName: "Wayne", barberName: "Barber 1", serviceType: "Service 4", appointmentDate: Date().addingTimeInterval(800.0), serviceCost: 23.3, color: .blue, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 2", serviceType: "Service 3", appointmentDate: Date().addingTimeInterval(8200.0), serviceCost: 223.3, color: .green, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 3", serviceType: "Service 2", appointmentDate: Date().addingTimeInterval(9800.0), serviceCost: 3.3, color: .orange, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 4", serviceType: "Service 1", appointmentDate: Date().addingTimeInterval(18000.0), serviceCost: 123.3, color: .red, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 5", serviceType: "Service 7", appointmentDate: Date().addingTimeInterval(80.0), serviceCost: 23.3, color: .pink, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 6", serviceType: "Service 8", appointmentDate: Date().addingTimeInterval(8440.0), serviceCost: 223.3, color: .purple, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 3", serviceType: "Service 2", appointmentDate: Date().addingTimeInterval(97600.0), serviceCost: 3.3, color: .gray, address: "Temple Meads", phoneNumber: "7579928376"),
            Appointment(custumerName: "Wayne", barberName: "Barber 4", serviceType: "Service 1", appointmentDate: Date().addingTimeInterval(4000.0), serviceCost: 123.3, color: .yellow, address: "Temple Meads", phoneNumber: "7579928376"),
        ]
    }
}

extension Appointment {
    struct Data {
        var custumerName: String = ""
        var barberName: String = ""
        var serviceType: String = ""
        var appointmentDate: Date = Date().addingTimeInterval(8440.0)
        var serviceCost: Double = 0.0
        var color: Color = .purple
        
        var address: String = ""
        var phoneNumber: String = ""
    }

    var data: Data {
        return Data(custumerName: custumerName, barberName: barberName, serviceType: serviceType, appointmentDate: appointmentDate, serviceCost: serviceCost, color: color, address: address, phoneNumber: phoneNumber)
    }
}
