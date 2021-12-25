//
//  Order.swift
//  codeWithSwiftUI
//

//

import Foundation

class Order {
    var id: UUID
    
    var barberShop: BarberShop
    var barber: Barber
    var customer: Customer
    
    var date: Date
//    var time
    var customerAddress: String
    
    var cost: Double
    var paymentMothod: String
    
    var orderNumber: String
    var notes: String?
    var orderStatus: OrderStatus
    var paymentStatus: PaymentStatus
    
    init(id: UUID = UUID(),
         barberShop: BarberShop,
      barber: Barber,
      customer: Customer,
      date: Date,
      customerAddress: String,
      cost: Double,
      paymentMothod: String,
      orderNumber: String,
      orderStatus: OrderStatus,
      paymentStatus: PaymentStatus
         ) {
        self.id = id
        self.barberShop = barberShop
        self.barber = barber
        self.customer = customer
        self.date = date
        self.customerAddress = customerAddress
        self.cost = cost
        self.paymentMothod = paymentMothod
        self.orderNumber = orderNumber
        self.orderStatus = orderStatus
        self.paymentStatus = paymentStatus
    }
}
