//
//  LoginView.swift
//  SecondTrialSwiftUI
//
//  Created by Wayne on 2021/7/22.
//

import SwiftUI

struct LoginView: View {
    @State var username:String = ""
    @State var password:String = ""
    var body: some View {
        VStack {
            TextField("Username",text: $username)
            TextField("Password",text: $password)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Log in")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign in")
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
