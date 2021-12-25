//
//  BarberTabView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct BarberTabView: View {
    
    @Binding var isBarberShop:Bool
    
    var body: some View {
        TabView {
            BarberManageView()
                .tabItem {
                    Label("Manage", systemImage: "hand.raised")
                }
            BarberOrderView()
                .tabItem {
                    Label("Orders", systemImage: "calendar")
                }
            BarberSettingView(isBarberShop: $isBarberShop)
                .tabItem {
                    Label("Settings", systemImage: "person")
                }
        }
        .accentColor(.blue)
        .background(Color.white)
        .ignoresSafeArea(edges: .all)
    }
}

struct BarberTabView_Previews: PreviewProvider {
    static var previews: some View {
        BarberTabView(isBarberShop: .constant(false))
    }
}
