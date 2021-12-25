//
//  codeWithSwiftUIApp.swift
//  codeWithSwiftUI
//

//

import SwiftUI

@main

struct codeWithSwiftUIApp: App {
    @State public static var internetCheck: Bool = true
    // tobe fixed
    var body: some Scene {
        WindowGroup {
            // ContentView()
            
                if codeWithSwiftUIApp.internetCheck {
                    TabView {
                        ExploreView()
                            .tabItem {
                                Label("Explore", systemImage: "magnifyingglass")
                            }
                        NavigationView {
                            FavoriteView(favoriteBarbers: Barber.data)
                        }
                        .tabItem {
                            Label("Favorite", systemImage: "heart")
                        }
                        NavigationView {
                            AppointmentView(appointments: Appointment.data)
                        }
                        .tabItem {
                            Label("Appointment", systemImage: "calendar")
                        }
                        ProfileView()
                            .tabItem {
                                Label("Profile", systemImage: "person")
                            }
                    }
                }
                else {
                    InternetCheck()
                }
            
            
            
            
        }
    }
}
