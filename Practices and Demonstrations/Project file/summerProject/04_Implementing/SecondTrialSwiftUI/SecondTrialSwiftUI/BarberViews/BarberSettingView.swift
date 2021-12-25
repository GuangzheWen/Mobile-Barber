//
//  BarberProfileView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct BarberSettingView: View {
    
    @Binding var isBarberShop:Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $isBarberShop) {
                Text("Alter Identity")
            }
            .padding()
        }
    }
}

struct BarberProfileView_Previews: PreviewProvider {
    static var previews: some View {
        BarberSettingView(isBarberShop: .constant(false))
    }
}
