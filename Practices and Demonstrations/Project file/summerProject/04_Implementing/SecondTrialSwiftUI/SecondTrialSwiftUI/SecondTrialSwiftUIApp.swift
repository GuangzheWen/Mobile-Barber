//
//  SecondTrialSwiftUIApp.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

@main
struct SecondTrialSwiftUIApp: App {
    
    @State var isBarberShop:Bool = false
    @State var isCustomer: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                IdentitySelectView(isBarberShop: $isBarberShop, isCustomer: $isCustomer)
                
                if isCustomer {
                    CustomerTabView(isCustomer: $isCustomer)
                } else if isBarberShop {
                    BarberTabView(isBarberShop: $isBarberShop)
                }
                
            }
            
        }
    }
}
