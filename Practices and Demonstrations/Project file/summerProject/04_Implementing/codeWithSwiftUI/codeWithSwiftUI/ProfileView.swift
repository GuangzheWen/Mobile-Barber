//
//  ProfileView.swift
//  codeWithSwiftUI
//

//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
//                Spacer()
                Text("Login          ")
            }
            
//            Spacer()
            List {
                Section(header: Text("Personal Info")){
                    Text("Account")
                    Text("Address")
                    Text("Payment Method")
                }
                Section(header: Text("Personal Info")){
                    Text("Notification")
                    Text("General Settings")
                    Text("Privacy")
                    Text("Help Center")
                }
                
                
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
