//
//  CustomerTabView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct CustomerTabView: View {
    
    @Binding var isCustomer: Bool
    
    
    var body: some View {
        TabView {
            CustomerExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            NavigationView {
                CustomerFavaoriteView(favoriteBarbers: Barber.data)
            }
            .tabItem {
                Label("Favorite", systemImage: "heart")
            }
            NavigationView {
                CustomerOrdersView(appointments: Appointment.data, isCustomer: $isCustomer)
            }
            .tabItem {
                Label("Orders", systemImage: "calendar")
            }
            NavigationView {
                CustomerSettingView(isCustomer: $isCustomer)
            }
            .tabItem {
                Label("Settings", systemImage: "person")
            }
        }
        .accentColor(.blue)
        .background(Color.white)
        .ignoresSafeArea(edges: .all)
    }
}

struct CustomerTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerTabView(isCustomer: .constant(false))
    }
}
