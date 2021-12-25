//
//  ContentView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct IdentitySelectView: View {
    
    @Binding var isBarberShop:Bool
    @Binding var isCustomer: Bool
    
    var body: some View {
        VStack {
            
            Text("WHO ARE YOU ?")
                .font(.largeTitle)
                .bold()
                .italic()
                .foregroundColor(Color(hue: 0.037, saturation: 0.656, brightness: 0.751))
                .shadow(color: .black.opacity(0.9), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
                .padding(.top, 200)
            
            Spacer()
            VStack {
                Button(action: {
                    isBarberShop = true
                }, label: {
                    Text("I am a Barber Shop")
                        .bold()
                })
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color(hue: 0.114, saturation: 0.605, brightness: 0.945))
                .cornerRadius(25)
                .padding(2)
                
                Button(action: {
                    isCustomer = true
                }, label: {
                    Text("I am a customer")
                        .bold()
                })
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color(hue: 0.622, saturation: 0.605, brightness: 0.945))
                .cornerRadius(25)
                .padding(2)
            }
            .foregroundColor(.blue)
            .padding(.bottom, 150)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IdentitySelectView(isBarberShop: .constant(false), isCustomer: .constant(false))
    }
}
