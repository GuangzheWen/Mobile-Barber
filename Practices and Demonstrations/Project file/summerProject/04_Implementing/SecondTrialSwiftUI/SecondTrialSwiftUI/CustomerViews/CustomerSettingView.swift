//
//  CustomerProfileView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/21.
//

import SwiftUI

struct CustomerSettingView: View {
    
    @Binding var isCustomer: Bool
    
    var body: some View {
        List {
            Section (header: Text("")){
                NavigationLink(destination: LoginView()) {
                    HStack(alignment: .center) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        Text("Log in")
                            .font(.largeTitle)
                            .padding(.leading, 10)
                    
                    }
                    .frame(width: 300, height: 100, alignment: .leading)
                }
            }
            
            Section (header: Text("Account")) {
                Text("Account")
            }
            
            Section (header: Text("Settings")){
                Text("Notification")
                Text("Privacy")
                Text("Storage and Data")
                Toggle(isOn: $isCustomer) {
                    Text("Alter Identity")
                }
            }
            Section (header: Text("Others")) {
                Text("Help")
                Text("Feedback")
                Text("Share")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Settings")
    }
}

struct CustomerSettingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerSettingView(isCustomer: .constant(false))
            .previewDevice("iPhone X")
    }
}
